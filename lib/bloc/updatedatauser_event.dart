part of 'updatedatauser_bloc.dart';

@immutable
abstract class UpdatedatauserEvent {}


class UpdatedatauserEvent2 extends UpdatedatauserEvent{
   final String id;
  final String username;
  final String email;
  final String password;
  final String konfir;

  UpdatedatauserEvent2(this.id, this.username, this.email, this.password, this.konfir);
  
}
