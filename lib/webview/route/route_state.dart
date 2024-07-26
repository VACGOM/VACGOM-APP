part of 'route_bloc.dart';

@immutable
class WebViewRouteState {
  final String url;
  final bool isBlueStatusBar;
  final bool showBottomBar;
  final bool isReplace;

  WebViewRouteState(
      this.url, this.isBlueStatusBar, this.showBottomBar, this.isReplace);
}
