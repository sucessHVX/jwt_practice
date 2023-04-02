import 'package:get/get.dart';
import 'package:robot/domain/post/post.dart';
import 'package:robot/domain/post/post_repository.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final posts = <Post>[].obs; //obs가 관찰 가능한 변수
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int? id) async {
    Post post = await _postRepository.findById(id!);
    this.post.value = post;
  }

  Future<void> deleteById(int? id) async {
    int result = await _postRepository.deleteById(id!);
    if (result == 1) {
      //where을 통해 값을 찾아내거나 걸러냄 js에서는 필터를 사용
      List<Post> result = posts.where((post) => post.id != id).toList();
      posts.value = result; //덮어씌우기 그림 다시 그려줌
    }
  }
}
