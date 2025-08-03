import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/updatedatauserapi.dart';
import 'package:latihanbloc2/model/updatedatausermodel.dart';
import 'package:meta/meta.dart';

part 'updatedatauser_event.dart';
part 'updatedatauser_state.dart';

class UpdatedatauserBloc extends Bloc<UpdatedatauserEvent, UpdatedatauserState> {
  late MessageSuccessupdatedatauser messageSuccessupdatedatauser;
  final Updatedatauserapi2 updatedatauserapi2=Updatedatauserapi2();
  UpdatedatauserBloc() : super(UpdatedatauserInitial()) {
    on<UpdatedatauserEvent>((event, emit)async {
      if(event is UpdatedatauserEvent2){
        emit(UpdatedatauserLoading());
        try {
          await Future.delayed(Duration(seconds: 5),()async {
            messageSuccessupdatedatauser=await updatedatauserapi2.profileuser(event.id, event.username, event.email, event.password, event.konfir);
            emit(UpdatedatauserSuccess(messageSuccessupdatedatauser));
          },);
        } catch (e) {
          emit(UpdatedatauserError(e.toString()));
        }
      }
    });
  }
}
