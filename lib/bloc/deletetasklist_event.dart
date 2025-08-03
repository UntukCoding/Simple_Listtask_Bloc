part of 'deletetasklist_bloc.dart';

@immutable
abstract class DeletetasklistEvent {}


class DeletetasklistEvent2 extends DeletetasklistEvent{
  final String id;

  DeletetasklistEvent2(this.id);

}
