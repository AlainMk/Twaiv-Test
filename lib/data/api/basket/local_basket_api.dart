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
    final basketsJson = preferences.getString(_basketCollectionKey);
    if (basketsJson != null) {
      final basketsMap =
          List<Map<dynamic, dynamic>>.from(jsonDecode(basketsJson));
      final baskets = Basket.fromJsonList(basketsMap);
      _controller.add(baskets);
    } else {
      _setValue(_basketCollectionKey, jsonEncode(fakeBaskets));
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
