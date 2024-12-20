import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_internet_connection_module.dart';

@module
abstract class ConnectivityPackage {
  @singleton
  Connectivity get connectivity;
}

@Singleton(as: IInternetConnectionModule)
class InternetConnectionModule extends IInternetConnectionModule {
  bool isConnectedToInternet = true;
  late StreamSubscription<List<ConnectivityResult>> connectionStream;
  InternetConnectionModule(super.connectivity) {
    connectionStream = connectivity.onConnectivityChanged
        .listen((final List<ConnectivityResult> newValues) {
      isConnectedToInternet = newValues.any(
          (final ConnectivityResult element) => <ConnectivityResult>[
                ConnectivityResult.wifi,
                ConnectivityResult.mobile,
                ConnectivityResult.vpn
              ].contains(element));
    });
  }
  @override
  bool get hasInternetConnection => isConnectedToInternet;

  @override
  void addListener(final void Function(bool hasInternetConnection) listener) =>
      connectivity.onConnectivityChanged
          .listen((final _) => listener(hasInternetConnection));

  @override
  @disposeMethod
  void dispose() {
    connectionStream.cancel();
    super.dispose();
  }
}
