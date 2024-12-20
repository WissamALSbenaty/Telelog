import 'package:telelog/src/enums.dart';

abstract class IHttpClient {
  IHttpClient();

  Future<void> sendRequest({
    required final RequestMethod requestType,
    required final String url,
    required final Map<String, dynamic> parameters,
  });
}
