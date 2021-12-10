import 'package:equatable/equatable.dart';

enum CounterStatus { initial, complete }

class CounterSate {
  final int count;
  final CounterStatus status;

  CounterSate._(this.count, this.status);

  CounterSate.initial() : this._(0, CounterStatus.initial);

  CounterSate.completed(int newCount)
      : this._(newCount, CounterStatus.complete);
}

// abstract class CounterState extends Equatable {
//   final int count;

//   const CounterState(this.count);
// }

// class CounterInitial extends CounterState {
//   const CounterInitial(int count) : super(0);

//   @override
//   List<Object?> get props => [];
// }

// class CounterCompleted extends CounterState {
//   const CounterCompleted(int count) : super(count);
//   @override
//   List<Object?> get props => [count];
// }
