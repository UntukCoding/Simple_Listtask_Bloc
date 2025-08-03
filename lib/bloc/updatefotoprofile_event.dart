part of 'updatefotoprofile_bloc.dart';

@immutable
abstract class UpdatefotoprofileEvent {}


 class UpdatefotoprofileEvent2 extends UpdatefotoprofileEvent {
  final File fotoprofile2;
  final String username;

  UpdatefotoprofileEvent2(this.fotoprofile2, this.username);
 }
