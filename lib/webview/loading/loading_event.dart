part of 'loading_bloc.dart';

@immutable
sealed class LoadingEvent {}

class LoadingProgress extends LoadingEvent {
  final int progress;

  LoadingProgress({required this.progress});
}
