import 'package:dio/dio.dart';

class DioConfig {
  late Dio dio;

  DioConfig() {
    BaseOptions baseOption = dioOptions();
    dio = Dio(baseOption);
  }
}

BaseOptions dioOptions() {
  return BaseOptions(
    baseUrl: "https://api.bmkg.go.id/publik/",
    connectTimeout: Duration(seconds: 7),
    receiveTimeout: Duration(seconds: 7),
  );
}
