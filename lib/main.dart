import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_app/bindings/StudentBindings.dart';
import 'package:student_app/utils/GetRoutes.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: GetRoutes.initialroute,
      initialBinding: StudentBindings(),
      getPages: GetRoutes.pages,
      title: 'Student App',
    );
  }
}
