part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int increasedBy;

  const CounterIncreased(this.increasedBy);
}

class CounterReseted extends CounterEvent {}