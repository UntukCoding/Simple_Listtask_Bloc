part of 'loginresponse_bloc.dart';

@immutable
abstract class LoginresponseEvent {}


class Kirimdata extends LoginresponseEvent{
  final String username;
  final String pass;

  Kirimdata(this.username, this.pass);
  
}
