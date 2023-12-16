import 'package:twaiv_test/data/model/basket.dart';
import 'package:twaiv_test/data/model/fruit.dart';

/// The interface for the Basket api that provides access to the Basket data.
abstract class BasketApi {
  /// {@macro Basket_api}
  const BasketApi();

  /// Provides a [Stream] of all Baskets.
  Stream<List<Basket>> getBaskets();

  /// Adds a new Basket .
  Future<void> addFruitToBasket(String basketId, Fruit fruit);
}

/// The exception that is thrown when a Basket is not found.
class BasketNotFoundException implements Exception {}
