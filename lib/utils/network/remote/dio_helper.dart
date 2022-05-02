import 'package:dio/dio.dart';
import 'end_points.dart';



class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: 5000,
          receiveTimeout: 3000,
          baseUrl: EndPoints.baseUrl
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }

}
