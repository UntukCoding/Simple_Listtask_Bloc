import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/addtasklistapi.dart';
import 'package:latihanbloc2/model/addtaskmodel.dart';
import 'package:meta/meta.dart';

part 'addtasklist_event.dart';
part 'addtasklist_state.dart';

class AddtasklistBloc extends Bloc<AddtasklistEvent, AddtasklistState> {
  late MessageSuccessaddtask messageSuccessaddtask;
  final Addtasklistapi2 addtasklistapi2=Addtasklistapi2();
  AddtasklistBloc() : super(AddtasklistInitial()) {
    on<AddtasklistEvent>((event, emit) async{
      if(event is AddtasklistEvent2){
        emit(AddtasklistLoading());
        try {
          await Future.delayed(Duration(seconds: 5),() async{
            messageSuccessaddtask=await addtasklistapi2.fecthdetail234(event.username, event.judul, event.keterangan, event.tanggal, event.waktu);
            emit(AddtasklistSuccess(messageSuccessaddtask));
          },);
        } catch (e) {
          emit(AddtasklistError(e.toString()));
        }
      }
    });
  }
}
