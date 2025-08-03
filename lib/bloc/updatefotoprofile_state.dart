part of 'updatefotoprofile_bloc.dart';

@immutable
abstract class UpdatefotoprofileState {}

class UpdatefotoprofileInitial extends UpdatefotoprofileState {}


class UpdatefotoprofileLoading extends UpdatefotoprofileState {}



class UpdatefotoprofileSuccess extends UpdatefotoprofileState {
  final MessageSuccessupdatefotoprofile messageSuccessupdatefotoprofile;

  UpdatefotoprofileSuccess(this.messageSuccessupdatefotoprofile);
  
}



class UpdatefotoprofilError extends UpdatefotoprofileState {
  final String Error;

  UpdatefotoprofilError(this.Error);
}
