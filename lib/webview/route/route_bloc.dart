import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'route_event.dart';
part 'route_state.dart';

class WebViewRouteBloc extends Bloc<WebViewRouteEvent, WebViewRouteState> {
  WebViewRouteBloc()
      : super(WebViewRouteState("https://vacgom.co.kr", true, true, true)) {
    on<WebviewNavigate>((event, emit) {
      emit(WebViewRouteState(event.url, event.isBlueStatusBar,
          event.showBottomBar, event.isReplace));
    });
  }
}
