part of 'deletetasklist_bloc.dart';

@immutable
abstract class DeletetasklistState {}

class DeletetasklistInitial extends DeletetasklistState {}

class DeletetasklistLoading extends DeletetasklistState {}


class DeletetasklistSuccess extends DeletetasklistState {
  MessageSuccesdeletetask messageSuccesdeletetask;
  DeletetasklistSuccess(this.messageSuccesdeletetask);
}


class DeletetasklistError extends DeletetasklistState {
  final String Error;
  DeletetasklistError(this.Error);
}
