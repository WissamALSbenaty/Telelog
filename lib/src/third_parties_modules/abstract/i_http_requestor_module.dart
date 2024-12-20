import 'package:dio/dio.dart';
import 'package:telelog/src/enums.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_module.dart';

abstract class IHttpRequestorModule extends IModule {
  Future<Response> request(
    final String url, {
    required final RequestMethod requestType,
    required final Map<String, dynamic> parameters,
  });
}
