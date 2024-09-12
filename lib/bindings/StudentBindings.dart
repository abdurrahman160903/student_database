import 'package:get/get.dart';
import 'package:student_app/controller/StudentController.dart';

class StudentBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StudentController());
  }
}
