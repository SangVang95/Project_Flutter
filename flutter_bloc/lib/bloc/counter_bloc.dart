

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter_state.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  // TODO: implement initialState
  CounterState get initialState => CounterState(number: 0);

  @override
  Stream<CounterState> mapEventToState(event) async* {

      if (event is IncrementEvent) {
        var newNumber = state.number += 1;
        var newState = CounterState(number: newNumber);
        yield newState;

      } else if (event is DecrementEvent) {
        var newNumber = state.number -= 1;
        var newState = CounterState(number: newNumber);
        yield newState;
      }
  }

}