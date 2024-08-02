part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetEvent {}

class BottomSheetInputChanged extends BottomSheetEvent {
  final String input;

  BottomSheetInputChanged(this.input);
}
