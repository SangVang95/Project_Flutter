part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterInitial extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterCompleted extends CounterState {
  final int count;
  CounterCompleted(this.count);

  @override
  // TODO: implement props
  List<Object?> get props => [count];
}
