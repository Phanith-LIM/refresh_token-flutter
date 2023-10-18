import 'package:get/get.dart';
import 'package:test_login/xcore.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';

  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}