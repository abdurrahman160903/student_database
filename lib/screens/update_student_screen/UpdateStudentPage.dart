import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app/common_widgets/TextButtonWidget.dart';
import 'package:student_app/common_widgets/TextFieldWidget.dart';
import 'package:student_app/db/DbHelper.dart';
import 'package:student_app/models/StudentModel.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({super.key});

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController cell = TextEditingController();

  dynamic argumentData = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = argumentData[0].studentName!;
    email.text = argumentData[0].email!;
    address.text = argumentData[0].address!;
    cell.text = argumentData[0].cell!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(argumentData[1]),
          ),
          body: Column(
            children: [
              TextFieldWidget(
                hintText: "Name",
                controller: name,
                textInputType: TextInputType.name,
                inputFormatter: [
                  FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                ],
              ),
              TextFieldWidget(
                hintText: "Email",
                controller: email,
                textInputType: TextInputType.emailAddress,
                inputFormatter: [
                  FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                  FilteringTextInputFormatter.allow(RegExp(
                      '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}')),
                ],
              ),
              TextFieldWidget(
                hintText: "Address",
                controller: address,
                textInputType: TextInputType.text,
                inputFormatter: [
                  FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9, ]')),
                ],
              ),
              TextFieldWidget(
                hintText: "Cell",
                controller: cell,
                textInputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextButtonWidget(btnName: "Submit", click: update),
              SizedBox(
                height: 10,
              ),
              TextButtonWidget(btnName: "Cancel", click: goBack)
            ],
          )),
    );
  }

  void update() async {
    var db = await DbHelper.instance;

    StudentModel studentModel = StudentModel(
        studentId: argumentData[0].studentId,
        studentName: name.text.toString(),
        email: email.text.toString(),
        address: address.text.toString(),
        cell: cell.text.toString());

    db.updateData(argumentData[0].studentId!, studentModel);
  }

  void goBack() => Get.back();
}

// TextField(
// controller: name..text,
// decoration: InputDecoration(
// border: InputBorder.none,
// labelText: 'Enter Name',
// hintText: 'Enter Your Name'),
// onChanged: (String value) {},
// ),
