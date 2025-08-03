part of 'updatedatauser_bloc.dart';

@immutable
abstract class UpdatedatauserState {}

class UpdatedatauserInitial extends UpdatedatauserState {}


class UpdatedatauserLoading extends UpdatedatauserState {}



class UpdatedatauserSuccess extends UpdatedatauserState {
  final MessageSuccessupdatedatauser messageSuccessupdatedatauser;
  UpdatedatauserSuccess(this.messageSuccessupdatedatauser);
}



class UpdatedatauserError extends UpdatedatauserState {
   // ignore: non_constant_identifier_names
   final String Error;
  UpdatedatauserError(this.Error);
}
