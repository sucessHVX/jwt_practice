import 'package:get/get_connect/http/src/response/response.dart';
import 'package:robot/controller/dto/cm_resp_dto.dart';
import 'package:robot/controller/dto/join_req_dto.dart';
import 'package:robot/controller/dto/login_req_dto.dart';
import 'package:robot/domain/user/user.dart';
import 'package:robot/domain/user/user_provider.dart';
import 'package:robot/util/jwt.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class UserRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    //.toJson을 통해 map으로 변경
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers; //여기 토큰 있음
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);
      String token = headers["authorization"];
      jwtToken = token;
      return principal;
    } else {
      return User();
    }
  }

  Future<User> join(String username, String password, String email) async {
    JoinReqDto joinReqDto = JoinReqDto(username, password, email);
    //.toJson을 통해 map으로 변경
    Response response = await _userProvider.join(joinReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      User user = User.fromJson(cmRespDto.data);
      return user;
    } else {
      return User();
    }
  }
}
