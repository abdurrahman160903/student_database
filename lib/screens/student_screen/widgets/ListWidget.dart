import 'package:flutter/material.dart';
import 'package:student_app/db/DbHelper.dart';
import 'package:student_app/models/StudentModel.dart';

class ListWidget extends StatelessWidget {
  ListWidget({super.key, required this.user});

  // required this.studentId,
  // required this.studentName,
  // required this.email,
  // required this.address,
  // required this.cell,

  // final int studentId;
  // final String studentName;
  // final String email;
  // final String address;
  // final String cell;

  StudentModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(user.studentId.toString()),
      title: Text(user.studentName!),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: ${user.email}'),
          Text('Address: ${user.address}'),
          Text('Cell: ${user.cell}'),
        ],
      ),
      trailing: GestureDetector(
          onTap: () async {
            var db = await DbHelper.instance;
            db.deleteData(user.studentId!);
          },
          child: Icon(Icons.delete)),
    );
  }
}
