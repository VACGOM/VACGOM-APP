part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class InputNickname extends OnboardingEvent {
  final String nickname;

  InputNickname(this.nickname);
}

class InputNicknameComplete extends OnboardingEvent {}
