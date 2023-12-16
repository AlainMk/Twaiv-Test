import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twaiv_test/data/api/tray/fake_data.dart';
import 'package:twaiv_test/data/api/tray/tray_api.dart';
import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/model/tray.dart';

class LocalTrayApi extends TrayApi {
  LocalTrayApi(this.preferences) {
    _init();
  }

  static const _trayCollectionKey = "_trays_";

  final SharedPreferences preferences;

  final _controller = BehaviorSubject<List<Tray>>.seeded(const []);

  void _init() {
    final traysJson = preferences.getString(_trayCollectionKey);
    if (traysJson != null) {
      final traysMap = List<Map<dynamic, dynamic>>.from(jsonDecode(traysJson));
      final trays = Tray.fromJsonList(traysMap);
      _controller.add(trays);
    } else {
      _setValue(_trayCollectionKey, jsonEncode(fakeTrays));
      _controller.add(Tray.fromJsonList(fakeTrays));
    }
  }

  @override
  Stream<List<Tray>> getTrays() => _controller.asBroadcastStream();

  @override
  Future<void> addFruit(String trayId, Fruit fruit) {
    final trays = [..._controller.value];
    final trayIndex = trays.indexWhere((t) => t.name == trayId);

    trays[trayIndex].fruits.add(fruit);

    _controller.add(trays);
    return _setValue(_trayCollectionKey, jsonEncode(trays));
  }

  @override
  Future<void> deleteFruit(String trayId, String fruitId) {
    final trays = [..._controller.value];
    final trayIndex = trays.indexWhere((t) => t.name == trayId);
    trays[trayIndex].fruits.removeWhere((f) => f.id == fruitId);
    _controller.add(trays);
    return _setValue(_trayCollectionKey, jsonEncode(trays));
  }

  Future<void> _setValue(String key, String value) =>
      preferences.setString(key, value);
}
