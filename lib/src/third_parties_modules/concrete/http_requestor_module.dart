import 'package:dio/dio.dart';
import 'package:telelog/src/enums.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_http_requestor_module.dart';

class HttpRequestorModule extends IHttpRequestorModule {
  final Dio _dio = Dio();
  HttpRequestorModule() {
    _dio.interceptors.addAll(<Interceptor>[
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      )
    ]);
  }
  @override
  Future<Response> request(
    final String url, {
    required final RequestMethod requestType,
    required final Map<String, dynamic> parameters,
  }) =>
      _dio.request(
        url,
        options: Options(
          method: requestType.name.toUpperCase(),
        ),
        queryParameters: parameters,
        onReceiveProgress: (final _, final __) {},
      );
}
