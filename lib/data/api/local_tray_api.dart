import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twaiv_test/data/api/fake_data.dart';
import 'package:twaiv_test/data/api/tray_api.dart';
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
      // preferences.setString(_trayCollectionKey, jsonEncode(fakeTrays));
      _controller.add(Tray.fromJsonList(fakeTrays));
    }
  }

  @override
  Stream<List<Tray>> getTrays() => _controller.asBroadcastStream();
}
