import 'package:get_it/get_it.dart';
import 'package:provider_example/core/services/authentivationService.dart';
import 'core/services/Api.dart';
import 'core/view_models/LognModel.dart';

GetIt locator = GetIt();
void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => AuthenticationService());
}
