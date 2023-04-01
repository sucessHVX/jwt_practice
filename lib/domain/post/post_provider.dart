import 'package:get/get.dart';
import 'package:robot/util/jwt.dart';

const host = "http://39.114.123.111:8080";

//통신 역할
class PostProvider extends GetConnect {
  //Map타입으로 전송을 해줘야 함 post방식으로
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});
}
