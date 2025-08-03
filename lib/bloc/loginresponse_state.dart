part of 'loginresponse_bloc.dart';

@immutable
abstract class LoginresponseState {}

class LoginresponseInitial extends LoginresponseState {}


class LoginresponseLoading extends LoginresponseState {}


class LoginresponseLoaded extends LoginresponseState {
  List<Login> login;
  LoginresponseLoaded(this.login);
}


class LoginresponseError extends LoginresponseState {
   final String Error;
  LoginresponseError(this.Error);
}

