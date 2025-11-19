import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_screen_events.freezed.dart';

@freezed
sealed class OnboardingScreenEvents with _$OnboardingScreenEvents{
  const factory OnboardingScreenEvents.InitializeOnboarding() = InitializeOnboardingEvent;
  const factory OnboardingScreenEvents.StartGoogleSignIn() = StartGoogleSignInEvent;
  const factory OnboardingScreenEvents.SignInSuccess() = SignInSuccessEvent;
  const factory OnboardingScreenEvents.SignInFailed() = SignInFailedEvent;
}