import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_internet_connection_module.dart';

abstract class ConnectivityPackage {
  Connectivity get connectivity;
}

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
  void dispose() {
    connectionStream.cancel();
    super.dispose();
  }
}
