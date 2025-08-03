part of 'addtasklist_bloc.dart';

@immutable
abstract class AddtasklistEvent {}


class AddtasklistEvent2 extends AddtasklistEvent{
  final String username;
  final String judul;
  final String keterangan;
  final String tanggal;
  final String waktu;

  AddtasklistEvent2(this.username, this.judul, this.keterangan, this.tanggal, this.waktu);
}