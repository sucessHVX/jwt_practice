import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/controller/user_controller.dart';
import 'package:robot/view/components/custom_elevated_button.dart';
import 'package:robot/view/components/custom_text_form_field.dart';
import 'package:robot/view/pages/app/home_page.dart';
import 'package:robot/view/pages/user/join_page.dart';
import 'package:robot/util/validator_util.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "도서관 로그인 ${u.isLogin}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "ID",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "pw",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formkey.currentState!.validate()) {
                //trim() 공백제거 해줌
                int result =
                    await u.login(_username.text.trim(), _password.text.trim());
                if (result == 1) {
                  Get.to(() => const HomePage());
                } else {
                  Get.snackbar("로그인 실패", "ID, PW 확인하세요");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(() => JoinPage());
            },
            child: const Text("회원가입"),
          ),
        ],
      ),
    );
  }
}
