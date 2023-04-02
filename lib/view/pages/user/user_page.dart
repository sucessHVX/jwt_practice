import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/controller/user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 번호 : ${u.principal.value.id}"),
            Text("회원 아이디 : ${u.principal.value.username}"),
            Text("회원 이메일 : ${u.principal.value.email}"),
            Text("회원 가입 날짜 : ${u.principal.value.created}"),
          ],
        ),
      ),
    );
  }
}
