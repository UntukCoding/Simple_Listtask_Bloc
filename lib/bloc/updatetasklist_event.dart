part of 'updatetasklist_bloc.dart';

@immutable
abstract class UpdatetasklistEvent {}

class UpdatetasklistEvent2 extends UpdatetasklistEvent {
  final String id;
  final String judul;
  final String keterangan;
  final String tanggal;
  final String waktu;

  UpdatetasklistEvent2(this.id, this.judul, this.keterangan, this.tanggal, this.waktu);
}
