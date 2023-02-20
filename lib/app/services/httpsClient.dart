import 'package:dio/dio.dart';

// https网络请求封装
class HttpsClient {
  static String domain = 'https://xiaomi.itying.com/';
  static Dio dio = Dio();

  HttpsClient() {
    dio.options.baseUrl = domain; // 请求地址
    dio.options.connectTimeout = 5000; //5s 超时时间
    dio.options.receiveTimeout = 3000;
    // dio.interceptors.add(element) 添加拦截器
  }

  static replaceUri(picUrl) {
    return domain + picUrl.replaceAll('\\', '/');
  }

  Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print(e);
      print('请求超时');
      return null;
    }
  }

  Future post(apiUrl, {Map? data}) async {
    try {
      var response = await dio.post(apiUrl, data: data);
      return response;
    } catch (e) {
      print(e);
      print('请求超时');
      return null;
    }
  }
}
