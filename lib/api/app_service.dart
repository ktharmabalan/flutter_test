import 'dart:async';
import 'package:hello_world/utils/network_util.dart';
import 'package:hello_world/models/user.dart';

class AppService {
  NetworkUtil _networkUtil = new NetworkUtil();
  static final BASE_URL = '';
  static final LOGIN_URL = BASE_URL + '/';

  Future<User> login(String username, String password) {
    return new Future.value(new User(username, password));
  }
}