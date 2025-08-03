import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/deletetasklist.dart';
import 'package:latihanbloc2/model/deletetaskmodel.dart';
import 'package:meta/meta.dart';

part 'deletetasklist_event.dart';
part 'deletetasklist_state.dart';

class DeletetasklistBloc extends Bloc<DeletetasklistEvent, DeletetasklistState> {
  late MessageSuccesdeletetask messageSuccesdeletetask;
  final Deletetasklist2 deletetasklist2=Deletetasklist2();
  DeletetasklistBloc() : super(DeletetasklistInitial()) {
    on<DeletetasklistEvent>((event, emit)async {
      if(event is DeletetasklistEvent2) {
        emit(DeletetasklistLoading());
        try {
          await Future.delayed(Duration(seconds: 5),() async{
            messageSuccesdeletetask=await deletetasklist2.deletetask(event.id);
            emit(DeletetasklistSuccess(messageSuccesdeletetask));
          },);
        } catch (e) {
          emit(DeletetasklistError(e.toString()));
        }
      }
    });
  }
}
