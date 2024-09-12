import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/db/DbHelper.dart';
import 'package:student_app/models/StudentModel.dart';

class StudentController extends GetxController {
  var db = DbHelper.instance;
  List<StudentModel> studentList = [];
  bool loading = true;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cell = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStudents();
  }

  getStudents() async {
    dynamic users = await db.getAllData();
    studentList =
        List<StudentModel>.from(users.map((v) => StudentModel.fromJson(v)))
            .toList();
    print(studentList.length);
    loading = false;
    update();
  }

  void addStudent() {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        address.text.isNotEmpty &&
        cell.text.isNotEmpty) {
      StudentModel studentModel = StudentModel(
          studentName: name.text.toString(),
          email: email.text.toString(),
          address: address.text.toString(),
          cell: cell.text.toString());
      db.insertData(studentModel);
    } else {
      print('Please filled properly');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
