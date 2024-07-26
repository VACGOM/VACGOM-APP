import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../service/OnboardingService.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<InputNickname>((event, emit) {
      emit(OnboardingInputState(event.nickname));
    });

    on<InputNicknameComplete>((event, emit) async {
      await OnboardingService().saveOnboardingStatus(state.nickname);
    });
  }
}
