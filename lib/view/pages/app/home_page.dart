import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/view/pages/app/detail_page.dart';
import 'package:robot/view/pages/app/write_page.dart';
import 'package:robot/view/pages/user/login_page.dart';
import 'package:robot/size.dart';

import '../user/user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "이걸로 넘김");
            },
            title: const Text("제목1"),
            leading: const Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}

Widget _navigation(BuildContext context) {
  return Container(
    //메뉴
    width: getDrawerWidth(context),
    height: double.infinity,
    color: Colors.white,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0), //모든면에 패딩
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
            onPressed: () {
              Get.to(WritePage());
            },
            child: const Text(
              "글쓰기",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Get.to(const UserPage());
            },
            child: const Text(
              "회원정보",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: const Text(
              "로그아웃",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          const Divider(),
        ]),
      ),
    ),
  );
}
