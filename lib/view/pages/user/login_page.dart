import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/controller/user_controller.dart';
import 'package:robot/view/components/custom_elevated_button.dart';
import 'package:robot/view/components/custom_text_form_field.dart';
import 'package:robot/view/pages/user/join_page.dart';
import 'package:robot/util/validator_util.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  UserController u = Get.put(UserController());

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
              child: const Text(
                "도서관 로그인",
                style: TextStyle(
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
            hint: "ID",
            funValidator: validateId(),
          ),
          CustomTextFormField(
            hint: "pw",
            funValidator: validatePw(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              if (_formkey.currentState!.validate()) {
                //Get.to(const HomePage());
                u.login("username", "password");
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: const Text("회원가입"),
          ),
        ],
      ),
    );
  }
}
