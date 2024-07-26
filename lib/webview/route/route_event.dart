part of 'route_bloc.dart';

@immutable
sealed class WebViewRouteEvent {}

class WebviewNavigate extends WebViewRouteEvent {
  final String url;
  final bool isBlueStatusBar;
  final bool showBottomBar;
  final bool isReplace;

  WebviewNavigate(
      {required this.url,
      required this.isBlueStatusBar,
      required this.showBottomBar,
      required this.isReplace});
}

class ChangeStatusBar extends WebViewRouteEvent {
  final bool isBlueStatusBar;

  ChangeStatusBar({required this.isBlueStatusBar});
}
