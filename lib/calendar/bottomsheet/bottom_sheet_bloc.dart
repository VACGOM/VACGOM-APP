import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(BottomSheetState(input: "")) {
    on<BottomSheetInputChanged>((event, emit) {
      emit(BottomSheetState(input: event.input));
    });
  }
}
