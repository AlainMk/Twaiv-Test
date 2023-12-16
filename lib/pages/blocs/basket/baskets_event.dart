part of 'baskets_bloc.dart';

abstract class BasketsEvent extends Equatable {
  const BasketsEvent();
}

/// AddFruitToBasket
class AddFruitToBasket extends BasketsEvent {
  ///
  const AddFruitToBasket({required this.basketId, required this.fruit});

  final String basketId;
  final Fruit fruit;

  @override
  List<Object> get props => [Basket, fruit];
}

/// GetBaskets
class GetBaskets extends BasketsEvent {
  ///
  const GetBaskets();
  @override
  List<Object> get props => [];
}
