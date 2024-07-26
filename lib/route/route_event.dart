part of 'route_bloc.dart';

@immutable
sealed class RouteEvent {}

final class Navigate extends RouteEvent {
  final String route;

  Navigate(this.route);

  @override
  toString() => 'Navigate: $route';
}

final class Navigated extends RouteEvent {
  final String route;

  Navigated(this.route);

  @override
  toString() => 'Navigated: $route';
}

