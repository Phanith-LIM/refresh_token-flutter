import 'package:get/get.dart';
import 'package:test_login/xcore.dart';
import 'package:get_storage/get_storage.dart';
abstract class ILoginRepository {
  Future<Response?> login(String username, String password);
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository() : super();

  @override
  Future<Response?> login(String username, String password) async {
    final _box = GetStorage();
    final response = await post('/AnonymousAdmin/Auth', {
      'username': username,
      'password': password
    });
    _box.write('token', response.body['token']);
    return response;
  }
}