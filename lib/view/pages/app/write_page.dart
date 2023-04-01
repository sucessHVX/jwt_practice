import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/view/components/custom_text_form_field.dart';
import 'package:robot/view/components/custom_textarea.dart';
import 'package:robot/util/validator_util.dart';

import '../../components/custom_elevated_button.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "제목",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                hint: "내용",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "등록",
                funPageRoute: () {
                  if (_formkey.currentState!.validate()) {
                    Get.off(const HomePage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
