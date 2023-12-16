import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:twaiv_test/data/model/basket.dart';
import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/repository/basket_repository.dart';

part 'baskets_event.dart';
part 'baskets_state.dart';

class BasketsBloc extends Bloc<BasketsEvent, BasketsState> {
  BasketsBloc() : super(const BasketsState()) {
    on<AddFruitToBasket>(_mapAddFruitToBasketToState);
    on<GetBaskets>(_mapGetBasketsToState);
    add(const GetBaskets());
  }

  /// AddFruitToBasket Event impl
  Future<void> _mapAddFruitToBasketToState(
    AddFruitToBasket event,
    Emitter<BasketsState> emit,
  ) async {
    emit(state.copyWith(status: BasketsStatus.loading));
    try {
      await _repository.addFruitToBasket(event.basketId, event.fruit);
      emit(state.copyWith(status: BasketsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: BasketsStatus.error));
    }
  }

  /// GetBaskets Event impl
  Future<void> _mapGetBasketsToState(
    GetBaskets event,
    Emitter<BasketsState> emit,
  ) async {
    emit(state.copyWith(status: BasketsStatus.loading));

    await emit.forEach<List<Basket>>(
      _repository.getBaskets(),
      onData: (baskets) => state.copyWith(
        status: BasketsStatus.success,
        baskets: baskets,
      ),
      onError: (_, __) => state.copyWith(
        status: BasketsStatus.error,
      ),
    );
  }

  final BasketRepository _repository = GetIt.I.get();
}
