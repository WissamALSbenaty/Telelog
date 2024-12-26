import 'package:dio/dio.dart';
import 'package:telelog/src/data/clients/i_http_client.dart';
import 'package:telelog/src/data/errors/api_error.dart';
import 'package:telelog/src/data/errors/core_errors.dart';
import 'package:telelog/src/enums.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_http_requestor_module.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_internet_connection_module.dart';

class HttpClient extends IHttpClient {
  final IHttpRequestorModule httpRequestorModule;
  final IInternetConnectionModule internetConnectionModule;

  HttpClient(this.httpRequestorModule, this.internetConnectionModule);

  @override
  Future<void> sendRequest({
    required final RequestMethod requestType,
    required final String url,
    required final Map<String, dynamic> parameters,
  }) async {
    if (!internetConnectionModule.hasInternetConnection) {
      throw InternetConnectionError();
    }
    try {
      await httpRequestorModule.request(
        url,
        parameters: parameters,
        requestType: requestType,
      );
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerError();
      }

      if ((e.response?.statusCode ?? 0) >= 500 || e.response!.data is String) {
        throw ServerError();
      }
      final Map<String, dynamic> data = e.response!.data;
      throw ApiError.fromJson(data).customError;
    } on Exception {
      throw ServerError();
    }
  }
}
