import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState extends Equatable {
  int counter;

  CounterState._();

  factory CounterState.inital() {
    return CounterState._()..counter = 0;
  }
  CounterState.success(this.counter);

  @override
  // TODO: implement props
  List<Object> get props => [counter];
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.inital());

  // giam() => emit(state);

  void increment() => emit(CounterState.success(state.counter + 1));
  // void decrement() => emit(stat;
}
