import 'package:get/get.dart';
import 'package:robot/domain/post/post_repository.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트

  void findAll() {
    _postRepository.findAll();
  }
}
