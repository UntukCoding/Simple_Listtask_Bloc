part of 'listask_bloc.dart';

@immutable
abstract class ListaskEvent {}


class Sendtata extends ListaskEvent{
  final String username;
  Sendtata(this.username);
}
