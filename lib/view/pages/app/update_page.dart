import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robot/view/components/custom_text_form_field.dart';
import 'package:robot/view/components/custom_textarea.dart';
import 'package:robot/util/validator_util.dart';

import '../../components/custom_elevated_button.dart';

class UpdatePage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  UpdatePage({super.key});

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
                value: "제목1" * 2,
              ),
              CustomTextArea(
                hint: "내용",
                funValidator: validateContent(),
                value: "내용2" * 20,
              ),
              CustomElevatedButton(
                text: "수정",
                funPageRoute: () {
                  if (_formkey.currentState!.validate()) {
                    //같은 페이지가 있으면 이동할 때 덮어씌우는개 좋음
                    Get.back();
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
