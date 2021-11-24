import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    // TODO: implement mapEventToState
    final currentState = state;
    if (event is Increase) {
      if (currentState is CounterCompleted) {
        var count = currentState.count;
        count++;
        yield CounterCompleted(count);
      } else {
        yield CounterCompleted(1);
      }
    } else {
      if (currentState is CounterCompleted) {
        var count = currentState.count;
        if (count == 0) {
          yield CounterCompleted(count);
        } else {
          count--;
          yield CounterCompleted(count);
        }
      }
    }
  }
}
