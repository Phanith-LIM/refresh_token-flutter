import 'dart:async';

import 'package:get/get.dart';
import 'package:test_login/home/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({required this.repository});

  final text = RxnString();
  Timer? timer;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
      onGetWelcome();
    });
    super.onInit();
  }

  Future<void> onGetWelcome() async {
    final result = await repository.getWelcome();
    print(repository.requestCount);
    if(result == null) {
      timer?.cancel();
      text.value = 'NULL';
    }
    text.value = '$result : ${repository.requestCount}';
  }
}