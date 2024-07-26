import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

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
    Navigator.of(context).pop();
    message.resolve(null);
  }
}
