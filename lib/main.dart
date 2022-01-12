import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/theme/app_theme.dart';
import 'app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      theme: AppTheme.lightTheme,
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
