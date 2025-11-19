import 'package:circleciguvi/base/logger_utils.dart';
import 'package:circleciguvi/onboarding/events/on_boarding_screen_events.dart';
import 'package:circleciguvi/onboarding/states/on_boarding_screen_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base/app_constants.dart';

class OnBoardingBloc extends Bloc<OnboardingScreenEvents, OnboardingScreenStates>{

  final _logger = LoggerUtils();
  final _TAG = "OnBoardingBloc";
  String? clientId;
  String? serverClientId;
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false; // has granted permissions?
  String _contactText = '';
  String _errorMessage = '';
  String _serverAuthCode = '';
  List<String> scopes = <String>[
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  OnBoardingBloc() : super(const OnboardingScreenStates.displayOnboardingView()){
    on<InitializeOnboardingEvent>(_startOnboarding);
    on<StartGoogleSignInEvent>(_startSignIn);
    on<SignInSuccessEvent>(_signInCompleted);
    on<SignInFailedEvent>(_signInFailed);
  }

  Future<void> _startOnboarding(InitializeOnboardingEvent event, Emitter<OnboardingScreenStates> emit) async{
    emit(const OnboardingScreenStates.displayOnboardingView());
  }

  Future<void> _startSignIn(StartGoogleSignInEvent event, Emitter<OnboardingScreenStates> emit) async{
    await startGoogleSignIn();
  }

  Future<void> _signInCompleted(SignInSuccessEvent event, Emitter<OnboardingScreenStates> emit) async{
    emit(OnboardingScreenStates.startNextScreen());
  }

  Future<void> _signInFailed(SignInFailedEvent event, Emitter<OnboardingScreenStates> emit) async{
    emit(OnboardingScreenStates.errorView("Failed to signin with google"));
  }

  ///Step - 1 - User has already logged in
  Future<User?> initializeFirebase() async {
    try {
      _logger.log(_TAG, "Starting with firebase initialisation");
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        _logger.log(_TAG, "User has signed in");
        // this is for us to remember
        // user has already logged in, don't irritate by showing log in again :)
        return Future.value(currentUser);
      } else {
        return null;
      }
    } catch (exception) {
      _logger.log(_TAG, "Failed to initialize Firebase: $exception");
      return null;
    }


  }

  ///Step - 2 - Show the popup and ask user to signin. It can result into success or failure
  Future<void> startGoogleSignIn() async{
    _logger.log(_TAG, "starting with signing in");
    User? currentUser;


    final GoogleSignIn signIn = GoogleSignIn.instance;
    signIn
        .initialize(clientId: clientId, serverClientId: serverClientId)
        .then((_) {
      signIn.authenticationEvents
          .listen(_handleAuthenticationEvent)
          .onError(_handleAuthenticationError);

      /// This example always uses the stream-based approach to determining
      /// which UI state to show, rather than using the future returned here,
      /// if any, to conditionally skip directly to the signed-in state.
      signIn.attemptLightweightAuthentication();
    });
  }

  ///Handle signin success
  Future<void> _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) async {
    // #docregion CheckAuthorization
    final GoogleSignInAccount? user = // ...
    // #enddocregion CheckAuthorization
    switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    // Check for existing authorization.
    // #docregion CheckAuthorization
    final GoogleSignInClientAuthorization? authorization =
    await user?.authorizationClient.authorizationForScopes(scopes);
    // #enddocregion CheckAuthorization

    _currentUser = user;
    _isAuthorized = authorization != null;
    _errorMessage = '';

    if(_currentUser != null){

      ///Fetch only the google data
      _logger.log(_TAG, "Storing user details $_currentUser");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.kDisplayName, _currentUser?.displayName ?? "Empty Name");
      await prefs.setBool(AppConstants.kHasUserLoggedIn, true);
      await prefs.setString(AppConstants.kPhotoUrl, _currentUser?.photoUrl ?? "Empty url");
      await prefs.setString(AppConstants.kEmailID, _currentUser?.email ?? "Empty email");
      await prefs.setString(AppConstants.kUserID, _currentUser?.id ?? "Empty Id");
      //add(SignInSuccessEvent());
      add(SignInFailedEvent());
    }
  }

  ///Handle signin error
  Future<void> _handleAuthenticationError(Object e) async {
    _currentUser = null;
    _isAuthorized = false;
    _errorMessage = e is GoogleSignInException
        ? _errorMessageFromSignInException(e)
        : 'Unknown error: $e';
    _logger.log(_TAG, "Error message $_errorMessage");
  }

  ///Show the error message on the user end gracefully
  String _errorMessageFromSignInException(GoogleSignInException e) {
    // In practice, an application should likely have specific handling for most
    // or all of the, but for simplicity this just handles cancel, and reports
    // the rest as generic errors.
    return switch (e.code) {
      GoogleSignInExceptionCode.canceled => 'Sign in canceled',
      _ => 'GoogleSignInException ${e.code}: ${e.description}',
    };
  }


  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _logger.log(_TAG, "Successfully signed out from Apple account.");
    } catch (exception) {
      _logger.log(_TAG, "Error signing out from Apple account: $exception");
    }
  }

}