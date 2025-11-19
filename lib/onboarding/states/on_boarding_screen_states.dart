import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_screen_states.freezed.dart';

@freezed
sealed class OnboardingScreenStates with _$OnboardingScreenStates{
  const factory OnboardingScreenStates.displayOnboardingView() = DisplayOnboardingView;
  const factory OnboardingScreenStates.loadingView() = DisplayLoadingView;
  const factory OnboardingScreenStates.errorView(String errorMessage) = DisplayErrorView;
  const factory OnboardingScreenStates.startNextScreen() = StartNextScreen;
}