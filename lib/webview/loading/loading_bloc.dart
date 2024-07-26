import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingState(0)) {
    on<LoadingProgress>((event, emit) {
      emit(LoadingState((event).progress));
    });
  }
}
