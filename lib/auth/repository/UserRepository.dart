import 'package:vacgom_app/api/api.dart';
import 'package:vacgom_app/api/dto/baby/BabyResponse.dart';
import 'package:vacgom_app/auth/model/User.dart';

class UserRepository {
  RestClient restClient;

  UserRepository(this.restClient);

  Future<BabyResponse> fetchBaby() async {
    final dto = await restClient.getBaby();
    return dto.data;
  }

  Future<User> fetchUser(String token) async {
    print("I fetch user");
    final dto = await restClient.getUser();

    print("I fetch dto");
    print(dto);
    return User(
        id: dto.data.id,
        role: dto.data.role,
        name: dto.data.name,
        babyName: dto.data.babyName,
        profileImageUrl: "",
        color: "#FF0000",
        isMaster: false,
        partnerUser: null);
  }
}
