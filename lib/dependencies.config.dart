// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/data/clients/http_client.dart' as _i469;
import 'src/data/clients/i_http_client.dart' as _i960;
import 'src/third_parties_modules/abstract/i_http_requestor_module.dart'
    as _i560;
import 'src/third_parties_modules/abstract/i_internet_connection_module.dart'
    as _i141;
import 'src/third_parties_modules/concrete/http_requestor_module.dart' as _i737;
import 'src/third_parties_modules/concrete/internet_connection_module.dart'
    as _i125;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final connectivityPackage = _$ConnectivityPackage();
  gh.singleton<_i895.Connectivity>(() => connectivityPackage.connectivity);
  gh.singleton<_i141.IInternetConnectionModule>(
    () => _i125.InternetConnectionModule(gh<_i895.Connectivity>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i560.IHttpRequestorModule>(() => _i737.HttpRequestorModule());
  gh.singleton<_i960.IHttpClient>(() => _i469.HttpClient(
        gh<_i560.IHttpRequestorModule>(),
        gh<_i141.IInternetConnectionModule>(),
      ));
  return getIt;
}

class _$ConnectivityPackage extends _i125.ConnectivityPackage {
  @override
  _i895.Connectivity get connectivity => _i895.Connectivity();
}
