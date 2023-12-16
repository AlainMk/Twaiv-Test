part of 'trays_bloc.dart';

abstract class TraysEvent extends Equatable {
  const TraysEvent();
}

/// AddFruit
class AddFruit extends TraysEvent {
  ///
  const AddFruit({required this.fruit, required this.trayId});

  final Fruit fruit;
  final String trayId;

  @override
  List<Object> get props => [fruit, trayId];
}

/// GetTrays
class GetTrays extends TraysEvent {
  ///
  const GetTrays();
  @override
  List<Object> get props => [];
}

///  RemoveFruit
class RemoveFruit extends TraysEvent {
  ///
  const RemoveFruit({required this.trayId, required this.fruitId});

  final String trayId;
  final String fruitId;
  @override
  List<Object> get props => [trayId, fruitId];
}
