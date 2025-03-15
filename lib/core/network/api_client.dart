import 'package:dio/dio.dart';
import 'package:social_sphere/core/constants/constants.dart';

class ApiClient {
  String baseUrl;
  final Dio _dio;
  ApiClient({this.baseUrl = Constants.BASE_URL})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {'Content-Type': 'application/json'},
          ),
        ) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Dio get dio => _dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await safeApiCall(_dio.get(path, queryParameters: queryParameters));
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return await safeApiCall(_dio.post(path, data: data));
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return await safeApiCall(_dio.put(path, data: data));
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    return await safeApiCall(_dio.delete(path, data: data));
  }

  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    return await safeApiCall(_dio.patch(path, data: data));
  }

  Future<Response> safeApiCall(Future<Response> apiCall) async {
    try {
      return await apiCall;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Future.error("Unauthorized: Login again");
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return Future.error("No internet connection");
      }
      return Future.error("Unexpected error: ${e.message}");
    }
  }
}
