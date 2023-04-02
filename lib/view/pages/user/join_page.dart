import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/controller/user_controller.dart';
import 'package:robot/view/components/custom_elevated_button.dart';
import 'package:robot/view/components/custom_text_form_field.dart';
import 'package:robot/view/pages/user/login_page.dart';
import 'package:robot/util/validator_util.dart';

class JoinPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _pw = TextEditingController();
  final _email = TextEditingController();

  JoinPage({super.key});

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
                "도서관 회원가입",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _id,
            hint: "ID",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _pw,
            hint: "pw",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _email,
            hint: "E-mail",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () async {
              if (_formkey.currentState!.validate()) {
                await Get.find<UserController>()
                    .join(_id.text, _pw.text, _email.text);
                Get.to(() => LoginPage());
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(() => LoginPage());
            },
            child: const Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
