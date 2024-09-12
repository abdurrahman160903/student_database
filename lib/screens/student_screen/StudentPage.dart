import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/StudentController.dart';
import 'package:student_app/screens/add_student_screen/AddStudentPage.dart';
import 'package:student_app/screens/student_screen/widgets/ListWidget.dart';
import 'package:student_app/screens/update_student_screen/UpdateStudentPage.dart';

class StudentPage extends GetView<StudentController> {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Student App'),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AddStudentpage()));
              Get.to(() => AddStudentPage());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.studentList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             UpdateStudentPage(studentModel: users[index])));
                          Get.to(() => UpdateStudentPage(), arguments: [
                            controller.studentList[index],
                            'Update Student Data'
                          ]);
                        },
                        child: ListWidget(
                          user: controller.studentList[index],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
