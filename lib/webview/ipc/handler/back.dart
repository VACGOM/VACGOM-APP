import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

import '../message/Message.dart';

class BackHandler {
  final BuildContext context;

  BackHandler(this.context);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "Back")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    if (!GoRouter.of(context).canPop()) {
      final user = context.read<AuthBloc>().state.user;
      if (context.read<AuthBloc>().state.isAuthenticated) {
        if (user!.role == "ROLE_TEMP_USER") {
          GoRouter.of(context).go("/onboarding");
        } else {
          GoRouter.of(context).go("/home");
        }
      } else {
        GoRouter.of(context).go("/login");
      }

      message.resolve(null);
    }

    GoRouter.of(context).pop();
    message.resolve(null);
  }
}
