import 'package:get/get.dart';
import 'package:test_login/login/repository.dart';
import 'package:test_login/xcore.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
      repository: Get.find<LoginRepository>(),
    ));
    Get.put<StorageService>(StorageService());
    Get.lazyPut(() => LoginRepository());
  }
}
