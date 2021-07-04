// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/firebase_authentication.dart' as _i4;
import '../services/firebase_servers.dart' as _i6;
import '../services/firebase_storage.dart' as _i5;
import '../services/openvpn.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.OpenVPN>(_i3.OpenVPN());
  gh.singleton<_i4.VPNFirebaseAuthentication>(_i4.VPNFirebaseAuthentication());
  gh.singleton<_i5.VPNFirebaseStorage>(_i5.VPNFirebaseStorage());
  gh.singleton<_i6.VPNServers>(_i6.VPNServers());
  return get;
}
