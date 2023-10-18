import 'package:get/get.dart' show GetConnect, Response;
import 'package:test_login/xcore.dart';

abstract class IHomeRepository {
  Future<String?> getWelcome();
}

class HomeRepository extends BaseRepository implements IHomeRepository {
  HomeRepository() : super();
  int requestCount = 0;
  @override
  Future<String?> getWelcome() async {
    final response = await get('/Admin/welcome');
    print('From -> ${response.body}');
    requestCount++;
    if(response.body == null) return null;
    return response.body;
  }

}