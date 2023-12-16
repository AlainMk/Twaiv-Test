import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/model/tray.dart';

abstract class TrayApi {
  Stream<List<Tray>> getTrays();

  /// Adds a fruit to a new tray.
  Future<void> addFruit(String trayId, Fruit fruit);

  /// Deletes a fruit from a tray.
  Future<void> deleteFruit(String trayId, String fruitId);
}
