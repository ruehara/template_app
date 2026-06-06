import 'package:equatable/equatable.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

final class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}

final class CounterDecremented extends CounterEvent {
  const CounterDecremented();
}

final class CounterReset extends CounterEvent {
  const CounterReset();
}
