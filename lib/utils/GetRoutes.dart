import 'package:get/get.dart';
import 'package:student_app/screens/student_screen/StudentPage.dart';
import 'constants.dart';

class GetRoutes {
  static const initialroute = studentpage;

  static final pages = [GetPage(name: studentpage, page: () => StudentPage())];
}
