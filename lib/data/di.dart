import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twaiv_test/data/api/local_tray_api.dart';
import 'package:twaiv_test/data/api/tray_api.dart';
import 'package:twaiv_test/data/repository/tray_repository.dart';

class DependencyInjector {
  static Future<void> inject() async {
    final preferences = await SharedPreferences.getInstance();

    // API's
    GetIt.instance.registerSingleton<TrayApi>(LocalTrayApi(preferences));

    // Repositories
    GetIt.instance.registerSingleton<TrayRepository>(TrayRepository());
  }
}
