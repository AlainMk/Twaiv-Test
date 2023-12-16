import 'package:get_it/get_it.dart';
import 'package:twaiv_test/data/api/tray_api.dart';
import 'package:twaiv_test/data/model/tray.dart';

class TrayRepository {
  final TrayApi api = GetIt.I.get();

  Stream<List<Tray>> getCartMenus() => api.getTrays();
}
