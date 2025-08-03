part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocEvent {}


class Kirimdata extends LoginblocEvent{
  final String username;
  final String email;
  final String pass;
  final String konfir;

  Kirimdata(this.username,this.email,this.pass,this.konfir);
}
