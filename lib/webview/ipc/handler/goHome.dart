import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../auth/auth_bloc.dart';
import '../message/Message.dart';

class GoHomeHandler {
  final BuildContext buildContext;

  GoHomeHandler(
    this.buildContext,
  );

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "GoHome")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    buildContext.read<AuthBloc>().add(OnBoardingCompleted());
  }
}
