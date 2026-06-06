import 'package:equatable/equatable.dart';

sealed class CounterState extends Equatable {
  const CounterState(this.count);
  final int count;

  @override
  List<Object?> get props => [count];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

final class CounterUpdated extends CounterState {
  const CounterUpdated(super.count);
}
