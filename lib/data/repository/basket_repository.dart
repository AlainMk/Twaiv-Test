import 'package:get_it/get_it.dart';
import 'package:twaiv_test/data/api/basket/basket_api.dart';
import 'package:twaiv_test/data/model/basket.dart';
import 'package:twaiv_test/data/model/fruit.dart';

class BasketRepository {
  final BasketApi _api = GetIt.I.get();

  Stream<List<Basket>> getBaskets() => _api.getBaskets();

  Future<void> addFruitToBasket(String basketId, Fruit fruit) =>
      _api.addFruitToBasket(basketId, fruit);
}
