import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/controller/post_controller.dart';
import 'package:robot/controller/user_controller.dart';
import 'package:robot/view/pages/app/home_page.dart';
import 'package:robot/view/pages/app/update_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;
  const DetailPage(this.id, {super.key}); //생성자로 받기

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; //이걸로 받으면 여기서 타입 정해줘야함 다이나믹으로 넘어옴
    UserController u = Get.find(); //이미 put으로 만들었으니 find를 이용해 찾기
    PostController p = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("아이디 : $id, 로그인 상태 : ${u.isLogin}"),
      ),
      body: Padding(
        //전체적인 여백
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //이 데이터는 컨트롤러에서 관리
                "${p.post.value.title}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              const Divider(),
              u.principal.value.id == p.post.value.user!.id
                  ? Row(
                      //가로정렬
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!);
                            Get.off(
                                () => HomePage()); //스택에서 삭제하고 돌아가기 나중에 상태관리로 갱신
                          },
                          child: const Text("삭제"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: const Text("수정"),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                //expanded로 높이를 줘서 제한 없앰
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
