import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import 'package:telelog/src/data/clients/http_client.dart';
import 'package:telelog/src/data/clients/i_http_client.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_http_requestor_module.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_internet_connection_module.dart';
import 'package:telelog/src/third_parties_modules/concrete/http_requestor_module.dart';
import 'package:telelog/src/third_parties_modules/concrete/internet_connection_module.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  final ConnectivityPackageImpl connectivityPackage = ConnectivityPackageImpl();
  getIt.registerSingleton<Connectivity>(connectivityPackage.connectivity,
      instanceName: 'ConnectivityTelelog');
  getIt.registerSingleton<IInternetConnectionModule>(
    InternetConnectionModule(
        getIt<Connectivity>(instanceName: 'ConnectivityTelelog')),
    instanceName: 'InternetConnectionModuleTelelog',
    dispose: (i) => i.dispose(),
  );
  getIt.registerSingleton<IHttpRequestorModule>(HttpRequestorModule(),
      instanceName: 'HttpRequestorModuleTelelog');
  getIt.registerSingleton<IHttpClient>(
      HttpClient(
        getIt<IHttpRequestorModule>(instanceName: 'HttpRequestorModuleTelelog'),
        getIt<IInternetConnectionModule>(
            instanceName: 'InternetConnectionModuleTelelog'),
      ),
      instanceName: 'HttpClientTelelog');
}

class ConnectivityPackageImpl extends ConnectivityPackage {
  @override
  Connectivity get connectivity => Connectivity();
}
