import 'package:student_app/models/StudentModel.dart';

abstract class DbOperation {
  dynamic insertData(StudentModel user);
  dynamic updateData(int value, StudentModel user);
  dynamic deleteData(int value);
  dynamic getAllData();
  dynamic getDataById(int value);
}
