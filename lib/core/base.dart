import 'dart:convert';
import 'package:test_login/xcore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class BaseRepository extends GetConnect {
  @protected
  final storage = Get.find<StorageService>();
  final _box = GetStorage();
  @override
  void onInit() {
    httpClient.baseUrl = 'https://authentication-dev-psekvgalha-as.a.run.app';
    httpClient.timeout = const Duration(seconds: 30);

    //Refresh Token
    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode == 401) {
        final newToken = await refreshAccessToken();
        storage.setToken(newToken, '');
        request.headers['Authorization'] = 'Bearer $newToken';

        final newResponse = await httpClient.request(
          request.url.path,
          request.method,
          body: request.bodyBytes,
        );
        return newResponse;
      }
      return response;
    });

    httpClient.addRequestModifier<dynamic>((request) {
      print('Token : ${storage.token}');
      request.headers['Authorization'] = 'Bearer ${storage.token}';
      return request;
    });
    super.onInit();
  }

  Future<String> refreshAccessToken() async {
    final response = await post('/AnonymousAdmin/RefreshToken', null);
    return response.body;
  }
}