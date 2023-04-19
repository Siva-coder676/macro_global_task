import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:macro_global_task/core/repository/reterofit.dart';

class MyApi {
  MyApi._internal() {
    httpWrapper = HttpWrapper();
  }
  static final MyApi _singleton = MyApi._internal();

  factory MyApi() => _singleton;

  late HttpWrapper httpWrapper;

  RestClient? getClient() {
    return httpWrapper.client;
  }
}

class HttpWrapper {
  Dio dio = new Dio();

  var baseUrl = "https://dummyjson.com";
  var client;

  final bool SHOW_LOGS = true;

  HttpWrapper._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 6000),
      receiveTimeout: Duration(seconds: 6000),
    );
    dio = Dio(options);

    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors
      ..add(InterceptorsWrapper(
        onResponse: (responce, handler) {
          return handler.next(responce);
        },
        onError: (DioError error,
            ErrorInterceptorHandler errorInterceptorHandler) async {},
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers.addAll({});
          return handler.next(options);
        },
      ))
      ..add(LogInterceptor(
        responseBody: SHOW_LOGS,
        requestBody: SHOW_LOGS,
      ));

    client = RestClient(dio, baseUrl: baseUrl);
  }

  static final HttpWrapper _singleton = HttpWrapper._internal();

  factory HttpWrapper() => _singleton;
}
