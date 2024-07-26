import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OnboardingService {
  Future<void> saveOnboardingStatus(String nickname) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    storage.write(key: "nickname", value: nickname);
  }

  Future<String?> getOnboardingStatus() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return await storage.read(key: "nickname");
  }
}
