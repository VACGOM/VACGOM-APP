import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'route_event.dart';

part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> with ChangeNotifier {
  RouteBloc() : super(RouteInitial()) {
    on<Navigate>((event, emit) {
      emit(RouteState(event.route));
      notifyListeners();
      emit(RouteState(null));
    });

    on<Navigated>((event, emit) {
      emit(RouteState(null));
    });
  }
}
