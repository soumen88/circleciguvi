import 'package:circleciguvi/commonwidgets/display_error_widget.dart';
import 'package:circleciguvi/home/home_screen.dart';
import 'package:circleciguvi/onboarding/events/on_boarding_screen_events.dart';
import 'package:circleciguvi/onboarding/on_boarding_bloc.dart';
import 'package:circleciguvi/onboarding/states/on_boarding_screen_states.dart';
import 'package:circleciguvi/productdisplay/api_demonstration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/logger_utils.dart';
import '../commonwidgets/display_loading_widget.dart';

class OnBoardingScreen extends StatelessWidget {

  final _logger = LoggerUtils();
  final _TAG = "OnBoardingScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => OnBoardingBloc(),
        child: BlocConsumer<OnBoardingBloc, OnboardingScreenStates>(
            builder: (BuildContext context, OnboardingScreenStates states){
              return states.maybeWhen(
                  displayOnboardingView: (){
                    return Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Lottie.asset("assets/animations/loading.json", height: 212),
                                Image.asset(
                                  "assets/images/city_open.png",
                                  height: 310,
                                  width: 350,
                                ),
                                const Text(
                                  "Ecommerce App",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )),
                      bottomNavigationBar: SizedBox(
                        height: 280,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                    BlocProvider.of<OnBoardingBloc>(context).add(StartGoogleSignInEvent());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.black
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/googleLogo.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                    BlocProvider.of<OnBoardingBloc>(context).add(OnboardingScreenEvents.SignInSuccess());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.black
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/googleLogo.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        "Skip Google Sign In",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.black
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/googleLogo.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        "Go to Home",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  loadingView: (){
                    return DisplayLoadingWidget();
                  },
                  errorView: (String errorMessage){
                    return DisplayErrorWidget(errorMessage: errorMessage);
                  },
                  orElse: (){
                    return Container();
                  }
              );
            },
            listener: (BuildContext context, OnboardingScreenStates states){
                states.whenOrNull(
                  startNextScreen: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiDemonstrationScreen()));
                  }
                );
            }
        ),
    );

  }
}