import 'package:get/get.dart';
import 'package:robot/domain/user/user_repository.dart';
import 'package:robot/util/jwt.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if (token != "-1") {
      isLogin.value = true;
      jwtToken = token;
    }
    return token;
  }
}
