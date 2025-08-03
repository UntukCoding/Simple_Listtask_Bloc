part of 'updatetasklist_bloc.dart';

@immutable
abstract class UpdatetasklistState {}

class UpdatetasklistInitial extends UpdatetasklistState {}

class UpdatetasklisLoaded extends UpdatetasklistState {}
class UpdatetasklistSuccess extends UpdatetasklistState {
  MessageSuccessedittask messageSuccessedittask;
  UpdatetasklistSuccess(this.messageSuccessedittask);
}
class UpdatetasklistError extends UpdatetasklistState {
  final String Error;
  UpdatetasklistError(this.Error);
}
