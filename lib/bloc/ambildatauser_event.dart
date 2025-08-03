part of 'ambildatauser_bloc.dart';

@immutable
abstract class AmbildatauserEvent {}

class AmbildatauserEvent2 extends AmbildatauserEvent{
  final String username;

  AmbildatauserEvent2(this.username);
}