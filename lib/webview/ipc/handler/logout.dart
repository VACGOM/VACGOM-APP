import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

import '../message/Message.dart';

class LogoutHandler {
  final BuildContext context;

  LogoutHandler(this.context);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "Logout")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    context.read<AuthBloc>().add(LogoutRequested());
  }
}
