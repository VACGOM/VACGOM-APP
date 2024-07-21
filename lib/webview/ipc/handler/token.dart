import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';
import 'package:vacgom_app/login/service/AuthService.dart';

import '../message/Message.dart';

class TokenHandler {
  final TokenRepository tokenRepository;

  TokenHandler(this.tokenRepository);

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "Token")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    String? token = await tokenRepository.getToken();
    print("토큰 제공함");
    print(token);
    message.resolve(token);
  }
}
