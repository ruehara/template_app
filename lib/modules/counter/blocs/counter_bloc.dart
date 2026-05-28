import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_events.dart';
import 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncremented>(
      (_, emit) => emit(CounterUpdated(state.count + 1)),
    );
    on<CounterDecremented>(
      (_, emit) => emit(CounterUpdated(state.count - 1)),
    );
    on<CounterReset>(
      (_, emit) => emit(const CounterInitial()),
    );
  }
}
