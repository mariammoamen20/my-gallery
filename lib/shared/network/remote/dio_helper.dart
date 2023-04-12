import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //static method for initialize dio object
  //take baseUrl
  static init() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        baseUrl: 'https://technichal.prominaagency.com/api/',
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? " "}'
    };
    return await dio.get(endPoint,
        queryParameters: queryParameters, data: data);
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? " "}'
    };
    return await dio.post(endPoint,
        queryParameters: queryParameters, data: data);
  }
}
