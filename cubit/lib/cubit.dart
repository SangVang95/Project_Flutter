import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  final int counter;

  CounterState.inital({this.counter = 0});
  CounterState.success(this.counter);
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.inital());

  // giam() => emit(state);

  void increment() => emit(CounterState.success(10));
  // void decrement() => emit(stat;
}
