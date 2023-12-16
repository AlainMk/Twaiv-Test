part of 'baskets_bloc.dart';

/// BasketsState
enum BasketsStatus { success, error, loading }

/// BasketsStatusX
extension BasketsStatusX on BasketsStatus {
  bool get isSuccess => this == BasketsStatus.success;
  bool get isError => this == BasketsStatus.error;
  bool get isLoading => this == BasketsStatus.loading;
}

/// BasketsState
class BasketsState extends Equatable {
  /// primary constructor
  const BasketsState({
    this.status = BasketsStatus.loading,
    this.baskets = const [],
    this.message = 'An error occurred',
  });

  /// Baskets
  final List<Basket> baskets;

  /// status
  final BasketsStatus status;

  /// message
  final String message;

  @override
  List<Object?> get props => [status, message, baskets];

  /// copyWith
  BasketsState copyWith({
    List<Basket>? baskets,
    BasketsStatus? status,
    String? message,
  }) {
    return BasketsState(
      baskets: baskets ?? this.baskets,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
