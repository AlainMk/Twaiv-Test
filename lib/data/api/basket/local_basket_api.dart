import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twaiv_test/data/api/basket/basket_api.dart';
import 'package:twaiv_test/data/api/basket/fake_data.dart';
import 'package:twaiv_test/data/model/basket.dart';
import 'package:twaiv_test/data/model/fruit.dart';

class LocalBasketApi extends BasketApi {
  LocalBasketApi(this.preferences) {
    _init();
  }

  static const _basketCollectionKey = "_baskets_";

  final SharedPreferences preferences;

  final _controller = BehaviorSubject<List<Basket>>.seeded(const []);

  void _init() {
    final traysJson = preferences.getString(_basketCollectionKey);
    if (traysJson != null) {
      final traysMap = List<Map<dynamic, dynamic>>.from(jsonDecode(traysJson));
      final trays = Basket.fromJsonList(traysMap);
      _controller.add(trays);
    } else {
      // _setValue(_basketCollectionKey, jsonEncode(fakeBaskets));
      _controller.add(Basket.fromJsonList(fakeBaskets));
    }
  }

  @override
  Stream<List<Basket>> getBaskets() => _controller.asBroadcastStream();

  @override
  Future<void> addFruitToBasket(String basketId, Fruit fruit) {
    final baskets = [..._controller.value];
    final basketIndex = baskets.indexWhere((b) => b.id == basketId);
    baskets[basketIndex].fruits.add(fruit);
    _controller.add(baskets);
    return _setValue(_basketCollectionKey, jsonEncode(baskets));
  }

  Future<void> _setValue(String key, String value) =>
      preferences.setString(key, value);
}
