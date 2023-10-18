import 'package:get/get.dart';
import 'package:test_login/xcore.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      repository: Get.find<HomeRepository>(),
    ));
    Get.lazyPut(() => HomeRepository());
  }
}