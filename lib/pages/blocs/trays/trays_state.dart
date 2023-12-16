part of 'trays_bloc.dart';

/// TraysState
enum TraysStatus { success, error, loading }

/// TraysStatusX
extension TraysStatusX on TraysStatus {
  bool get isSuccess => this == TraysStatus.success;
  bool get isError => this == TraysStatus.error;
  bool get isLoading => this == TraysStatus.loading;
}

/// TraysState
class TraysState extends Equatable {
  /// primary constructor
  const TraysState({
    this.status = TraysStatus.loading,
    this.trays = const [],
    this.message = 'An error occurred',
  });

  /// Trays
  final List<Tray> trays;

  /// status
  final TraysStatus status;

  /// message
  final String message;

  @override
  List<Object?> get props => [status, message, trays];

  /// copyWith
  TraysState copyWith({
    List<Tray>? trays,
    TraysStatus? status,
    String? message,
  }) {
    return TraysState(
      trays: trays ?? this.trays,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
