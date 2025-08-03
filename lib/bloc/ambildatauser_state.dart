part of 'ambildatauser_bloc.dart';

@immutable
abstract class AmbildatauserState {}

class AmbildatauserInitial extends AmbildatauserState {}


class AmbildatauserLoading extends AmbildatauserState {}


class AmbildatauserSuccess extends AmbildatauserState {
  final List<Hasil2> hasil2;
  AmbildatauserSuccess(this.hasil2);
}



class AmbildatauserError extends AmbildatauserState {
  final String Error;

  AmbildatauserError(this.Error);
  
}

