import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/StudentController.dart';
import 'package:student_app/common_widgets/TextButtonWidget.dart';

import '../../common_widgets/TextFieldWidget.dart';

class AddStudentPage extends GetView<StudentController> {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            hintText: "Name",
            controller: controller.name,
            textInputType: TextInputType.text,
            inputFormatter: [
              FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              LengthLimitingTextInputFormatter(30),
            ],
          ),
          TextFieldWidget(
            hintText: "Email",
            controller: controller.email,
            textInputType: TextInputType.emailAddress,
            inputFormatter: [
              FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-@]')),
            ],
          ),
          TextFieldWidget(
            hintText: "Address",
            controller: controller.address,
            textInputType: TextInputType.text,
            inputFormatter: [
              FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9., ]')),
            ],
          ),
          TextFieldWidget(
            hintText: "Cell #",
            controller: controller.cell,
            textInputType: TextInputType.number,
            inputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
          ),
          TextButtonWidget(btnName: "Submit", click: controller.addStudent)
        ],
      ),
    ));
  }
}
