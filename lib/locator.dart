import 'package:get_it/get_it.dart';
import './core/services/api.dart';
import './core/services/apiProfile.dart';
import './core/viewmodels/CRUDModel.dart';
import './core/viewmodels/CRUDPerfil.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('trabajos'));
  locator.registerLazySingleton(() => ApiPerfil('perfil'));
  locator.registerLazySingleton(() => CRUDModel());
  locator.registerLazySingleton(() => CRUDPerfil());
}
