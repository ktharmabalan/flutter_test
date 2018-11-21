class NetworkUtil {

  static NetworkUtil _instance = new NetworkUtil._internal();
  factory NetworkUtil() => _instance;

  Future<dynamic> get() {
    return null;
  }

  NetworkUtil._internal();
}