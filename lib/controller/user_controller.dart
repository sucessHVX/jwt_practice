import 'package:get/get.dart';
import 'package:robot/domain/user/user_repository.dart';
import 'package:robot/util/jwt.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Future<void> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
    jwtToken = token;
    print(jwtToken);
  }
}
