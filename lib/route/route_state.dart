part of 'route_bloc.dart';

@immutable
class RouteState extends Equatable {
  final String route;

  const RouteState(this.route);

  @override
  List<Object?> get props => [route];
}

final class RouteInitial extends RouteState {
  RouteInitial() : super('/');
}
