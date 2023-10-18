import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_login/xcore.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  LoginController({required this.repository});

  final usernameCtl =  TextEditingController(text: 'username4');
  final passwordCtl =  TextEditingController(text: 'password');

  void onLogin() async {
    final username = usernameCtl.text;
    final password = passwordCtl.text;
    final result = await repository.login(username, password);
    if(result != null){
      Get.toNamed(Routes.home);
      Get.snackbar('Success', 'Login successfully');
    }else{
      Get.snackbar('Error', 'Fail successfully');
    }
  }
}
