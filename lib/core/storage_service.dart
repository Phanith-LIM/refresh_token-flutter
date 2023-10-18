import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
const _token = 'token';
const _refreshToken = 'refresh_token';

class StorageService extends GetxService {
  final _box = GetStorage();
  final _loggedIn = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  String? get token => _box.read<String>(_token);

  void setToken(String token, refresh) {
    _box.write(_token, token);
    _box.write(_refreshToken, refresh);
  }

  String? get refreshToken => _box.read<String>(_refreshToken);

  void removeToken() {
    _box.remove(_token);
    _box.remove(_refreshToken);
    _loggedIn.value = false;
  }
}


