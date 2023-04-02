import 'package:get/get.dart';
import 'package:robot/domain/user/user.dart';
import 'package:robot/domain/user/user_repository.dart';
import 'package:robot/util/jwt.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;
  final joins = <User>[].obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.id != null) {
      isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<void> join(String username, String password, String email) async {
    User principal = await _userRepository.join(username, password, email);

    if (principal.id != null) {
      joins.add(principal);
    }
  }
}
