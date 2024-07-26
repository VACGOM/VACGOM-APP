import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

import '../message/Message.dart';

class NicknameHandler {
  final FlutterSecureStorage secureStorage;

  NicknameHandler(this.secureStorage);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "Nickname")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    String? nickname = await secureStorage.read(key: "nickname");

    message.resolve(nickname);
  }
}
