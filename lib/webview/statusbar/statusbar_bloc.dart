import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statusbar_event.dart';
part 'statusbar_state.dart';

class StatusbarBloc extends Bloc<StatusbarEvent, StatusbarState> {
  StatusbarBloc() : super(StatusbarState(isBlueStatusBar: false)) {
    on<StatusbarEvent>((event, emit) {
      this.state.isBlueStatusBar = event.isBlueStatusBar;
    });
  }
}
