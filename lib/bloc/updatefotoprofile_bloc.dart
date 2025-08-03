import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/updateprofileapi.dart';
import 'package:latihanbloc2/model/updatefotoprofilemodel.dart';
import 'package:meta/meta.dart';
import 'dart:io';

part 'updatefotoprofile_event.dart';
part 'updatefotoprofile_state.dart';

class UpdatefotoprofileBloc extends Bloc<UpdatefotoprofileEvent, UpdatefotoprofileState> {
  late MessageSuccessupdatefotoprofile messageSuccessupdatefotoprofile;
  final Updatefotoprofileapi2 updatefotoprofileapi2=Updatefotoprofileapi2();
  UpdatefotoprofileBloc() : super(UpdatefotoprofileInitial()) {
    on<UpdatefotoprofileEvent>((event, emit)async {
      if(event is UpdatefotoprofileEvent2){
        emit(UpdatefotoprofileLoading());
        try {
          await Future.delayed(Duration(seconds: 5),()async {
            messageSuccessupdatefotoprofile=await updatefotoprofileapi2.updatefoto(event.fotoprofile2, event.username);
            emit(UpdatefotoprofileSuccess(messageSuccessupdatefotoprofile));
          },);
        } catch (e) {
          emit(UpdatefotoprofilError(e.toString()));
        }
      }
    });
  }
}
