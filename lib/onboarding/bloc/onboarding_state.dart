part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {
  late String nickname;

  OnboardingState(this.nickname);

  bool isActive() {
    if (nickname.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

final class OnboardingInitial extends OnboardingState {
  OnboardingInitial() : super('');
}

final class OnboardingInputState extends OnboardingState {
  OnboardingInputState(String nickname) : super(nickname);
}
