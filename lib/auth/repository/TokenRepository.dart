import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> reset() {
    return _storage.deleteAll();
  }

  Future<void> saveToken(String token) {
    return _storage.write(key: "jwt", value: token);
  }

  Future<String?> getToken() {
    return _storage.read(key: "jwt");
  }

  Future<void> deleteToken() {
    return _storage.delete(key: "jwt");
  }
}
