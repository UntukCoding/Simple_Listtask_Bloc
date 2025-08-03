import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/updatelistapi.dart';
import 'package:latihanbloc2/model/updatetaskmodel.dart';
import 'package:meta/meta.dart';

part 'updatetasklist_event.dart';
part 'updatetasklist_state.dart';

class UpdatetasklistBloc extends Bloc<UpdatetasklistEvent, UpdatetasklistState> {
  late MessageSuccessedittask messageSuccessedittask;
  final Updatelistapi2 updatelistapi2=Updatelistapi2();
  UpdatetasklistBloc() : super(UpdatetasklistInitial()) {
    on<UpdatetasklistEvent>((event, emit) async {
     if(event is UpdatetasklistEvent2){
      emit(UpdatetasklisLoaded());
      try {
        await Future.delayed(Duration(seconds: 5),()async {
          messageSuccessedittask=await updatelistapi2.fetcthdata3kali(event.id, event.judul, event.keterangan, event.tanggal, event.waktu);
          emit(UpdatetasklistSuccess(messageSuccessedittask));
        },);
      } catch (e) {
        emit(UpdatetasklistError(e.toString()));
      }
     }
    });
  }
}
