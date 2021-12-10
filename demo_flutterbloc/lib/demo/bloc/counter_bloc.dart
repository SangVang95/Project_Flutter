import 'package:demo_flutterbloc/demo/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterSate> {
  CounterBloc() : super(CounterSate.initial()) {
    on(
      (event, emit) => {
        if (event is CounterIncrement)
          {
            emit(CounterSate.completed(state.count + 1)),
          }
        else
          {
            if (state.count != 0)
              emit(
                CounterSate.completed(state.count - 1),
              )
          }
      },
    );
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);

    // if (event is CounterIncrement) {
    //   emit(CounterCompleted(state.count + 1));
    // } else {
    //   if (state.count != 0) emit(CounterCompleted(state.count - 1));
    // }

    // if (event is CounterIncrement) {
    //   emit(CounterSate.completed(state.count + 1));
    // } else {
    //   if (state.count != 0) emit(CounterSate.completed(state.count - 1));
    // }
  }

  @override
  void onChange(Change<CounterSate> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterSate> transition) {
    super.onTransition(transition);
    print(1);
    print(transition);
  }
}
