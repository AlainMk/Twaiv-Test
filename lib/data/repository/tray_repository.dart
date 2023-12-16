import 'package:get_it/get_it.dart';
import 'package:twaiv_test/data/api/tray/tray_api.dart';
import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/model/tray.dart';

class TrayRepository {
  final TrayApi _api = GetIt.I.get();

  Stream<List<Tray>> getTrays() => _api.getTrays();

  Future<void> addFruit(String trayId, Fruit fruit) =>
      _api.addFruit(trayId, fruit);

  Future<void> deleteFruit(String trayId, String fruitId) =>
      _api.deleteFruit(trayId, fruitId);
}
