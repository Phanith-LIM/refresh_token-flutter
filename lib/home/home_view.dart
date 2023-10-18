import 'package:flutter/material.dart';
import 'package:test_login/xcore.dart';
import 'package:get/get.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            controller.text.value.toString(),
            style: const TextStyle(fontSize: 20),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onGetWelcome();
        },
        child: const Icon(Icons.refresh),
      )
    );
  }
}
