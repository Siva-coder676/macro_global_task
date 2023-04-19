import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/services/local_service.dart';
import 'package:macro_global_task/core/services/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

class LocatorInjector {
  static Future<void> setUpLocator() async {
    Logger().w('Locator Injector');

    Logger().d('Registering Navigation Service');
    locator.registerLazySingleton(() => NavigationService());

    Logger().d('Registering Snackbar Service');
    locator.registerLazySingleton(() => SnackbarService());

    Logger().d('Registering Product Service');
    locator.registerLazySingleton(() => ProductService());
    Logger().d('Registering Local Service');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => LocalService(prefs));
  }
}
