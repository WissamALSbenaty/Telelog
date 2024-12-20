import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:telelog/src/third_parties_modules/abstract/i_module.dart';

abstract class IInternetConnectionModule extends IModule {
  final Connectivity connectivity;

  IInternetConnectionModule(this.connectivity);
  bool get hasInternetConnection;
  void addListener(final void Function(bool hasInternetConnection) listener);
}
