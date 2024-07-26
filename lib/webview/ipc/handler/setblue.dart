import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/webview/statusbar/statusbar_bloc.dart';

import '../message/Message.dart';

class SetBlueHandler {
  final BuildContext context;

  SetBlueHandler(this.context);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "SetBlue")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    context.read<StatusbarBloc>().add(StatusbarEvent(isBlueStatusBar: true));
  }
}
