import 'package:get/get_connect/http/src/response/response.dart';
import 'package:robot/controller/dto/login_req_dto.dart';
import 'package:robot/domain/user/user_provider.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class UserRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    //.toJson을 통해 map으로 변경
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers; //여기 토큰 있음

    if (headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token; //스트링 타입으로 반환
    }
  }
}
