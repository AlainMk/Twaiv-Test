import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/model/tray.dart';
import 'package:twaiv_test/data/repository/tray_repository.dart';

part 'trays_event.dart';
part 'trays_state.dart';

class TraysBloc extends Bloc<TraysEvent, TraysState> {
  TraysBloc() : super(const TraysState()) {
    on<AddFruit>(_mapAddFruitToState);
    on<RemoveFruit>(_mapRemoveFruitToState);
    on<GetTrays>(_mapGetTraysToState);
    add(const GetTrays());
  }

  /// AddFruit Event impl
  Future<void> _mapAddFruitToState(
    AddFruit event,
    Emitter<TraysState> emit,
  ) async {
    emit(state.copyWith(status: TraysStatus.loading));
    try {
      await _repository.addFruit(event.trayId, event.fruit);
      emit(state.copyWith(status: TraysStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TraysStatus.error));
    }
  }

  /// RemoveFruit Event impl
  Future<void> _mapRemoveFruitToState(
    RemoveFruit event,
    Emitter<TraysState> emit,
  ) async {
    emit(state.copyWith(status: TraysStatus.loading));
    try {
      await _repository.deleteFruit(event.trayId, event.fruitId);
      emit(state.copyWith(status: TraysStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TraysStatus.error));
    }
  }

  /// GetTrays Event impl
  Future<void> _mapGetTraysToState(
    GetTrays event,
    Emitter<TraysState> emit,
  ) async {
    emit(state.copyWith(status: TraysStatus.loading));

    await emit.forEach<List<Tray>>(
      _repository.getTrays(),
      onData: (trays) => state.copyWith(
        status: TraysStatus.success,
        trays: trays,
      ),
      onError: (_, __) => state.copyWith(
        status: TraysStatus.error,
      ),
    );
  }

  final TrayRepository _repository = GetIt.I.get();
}
