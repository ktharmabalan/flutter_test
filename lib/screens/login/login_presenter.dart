import 'package:hello_world/api/app_service.dart';
import 'package:hello_world/models/user.dart';

abstract class LoginContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPresenter {
  LoginContract _view;
  AppService api = new AppService();
  LoginPresenter(this._view);

  doLogin(String username, String password) {
    api
      .login(username, password)
      .then((user) => _view.onLoginSuccess(user))
      .catchError((onError) => _view.onLoginError(onError));
  }
}