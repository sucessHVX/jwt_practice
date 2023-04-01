import 'package:get/get_connect/http/src/response/response.dart';
import 'package:robot/controller/dto/cm_resp_dto.dart';
import 'package:robot/domain/post/post_provider.dart';
import 'package:robot/util/convert_utf8.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class PostRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    print(cmRespDto.code);
    print(cmRespDto.msg);
    print(cmRespDto.data);
  }
}
