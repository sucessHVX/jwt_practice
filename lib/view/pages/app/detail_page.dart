import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/view/pages/app/home_page.dart';
import 'package:robot/view/pages/app/update_page.dart';

class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage(this.id, {super.key}); //생성자로 받기

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; //이걸로 받으면 여기서 타입 정해줘야함 다이나믹으로 넘어옴
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        //전체적인 여백
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "글 제목!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const Divider(),
            Row(
              //가로정렬
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(const HomePage()); //스택에서 삭제하고 돌아가기 나중에 상태관리로 갱신
                  },
                  child: const Text("삭제"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: const Text("수정"),
                ),
              ],
            ),
            Expanded(
              //expanded로 높이를 줘서 제한 없앰
              child: SingleChildScrollView(
                child: Text("글 내용!!" * 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
