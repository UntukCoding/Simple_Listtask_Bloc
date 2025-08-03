part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocState {}

class LoginblocInitial extends LoginblocState {}


class LoginblocLoading extends LoginblocState {}

class LoginblocLoaded extends LoginblocState {
  final AutoGenerate autoGenerate;

  LoginblocLoaded(this.autoGenerate);
}


class Loginblocerror extends LoginblocState {
  final String Error;
  Loginblocerror(this.Error);
}