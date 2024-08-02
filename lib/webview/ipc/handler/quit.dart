import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

import '../../../api/api.dart';
import '../message/Message.dart';

class QuitHandler {
  final BuildContext context;

  QuitHandler(this.context);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "Quit")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    final tokenRepository = context.read<AuthBloc>().tokenRepository;
    final token = await tokenRepository.getToken();
    final client = RestClient(
        Dio(BaseOptions(headers: {"Authorization": "Bearer ${token}"})));

    await client.deleteUser();
    context.read<AuthBloc>().add(LogoutRequested());
  }
}
