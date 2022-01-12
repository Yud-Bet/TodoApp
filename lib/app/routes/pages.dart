import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/home_binding.dart';
import 'package:todo_app/app/modules/home/screens/home_screen.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [GetPage(name: Routes.home, page: () => HomeScreen(), binding: HomeBinding())];
}
