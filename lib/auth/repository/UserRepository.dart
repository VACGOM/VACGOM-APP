import 'package:dio/dio.dart';
import 'package:vacgom_app/api/api.dart';

class UserRepository {
  final RestClient _restClient = RestClient(Dio());

  Future<void> fetchUser() async {}
}
