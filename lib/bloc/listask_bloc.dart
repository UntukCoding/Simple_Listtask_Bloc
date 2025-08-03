import 'package:bloc/bloc.dart';

import 'package:latihanbloc2/model/tasklist.dart';
import 'package:meta/meta.dart';

import '../apis/getlist.dart';

part 'listask_event.dart';
part 'listask_state.dart';

class ListaskBloc extends Bloc<ListaskEvent, ListaskState> {

  late List<Hasil> hasil;
  final Dapatlist2 dapatlist2=Dapatlist2();
  ListaskBloc() : super(ListaskInitial()) {
    on<ListaskEvent>((event, emit) async {
      if(event is Sendtata){
        emit(ListaskLoading());
        try {
          await Future.delayed(Duration(seconds: 5),() async{
            hasil=await dapatlist2.getdata2kali(event.username);
            emit(ListaskLoaded(hasil));
          },);
        } catch (e) {
          emit(ListaskError(e.toString()));
        }
      }
    });
  }
}
