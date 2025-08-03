part of 'addtasklist_bloc.dart';

@immutable
abstract class AddtasklistState {}

class AddtasklistInitial extends AddtasklistState {}


class AddtasklistLoading extends AddtasklistState {}

class AddtasklistSuccess extends AddtasklistState {
  MessageSuccessaddtask messageSuccessaddtask;
  AddtasklistSuccess(this.messageSuccessaddtask);
}

class AddtasklistError extends AddtasklistState {
  final String Error;
  AddtasklistError(this.Error);
}