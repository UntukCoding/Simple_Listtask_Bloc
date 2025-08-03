import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/apis/ambildatauserapi.dart';
import 'package:latihanbloc2/model/ambildatausermodel.dart';
import 'package:meta/meta.dart';

part 'ambildatauser_event.dart';
part 'ambildatauser_state.dart';

class AmbildatauserBloc extends Bloc<AmbildatauserEvent, AmbildatauserState> {
  late List<Hasil2> hasil;
  final Ambildatauserapi2 ambildatauserapi2=Ambildatauserapi2();
  AmbildatauserBloc() : super(AmbildatauserInitial()) {
    on<AmbildatauserEvent>((event, emit) async{
      if(event is AmbildatauserEvent2){
        emit(AmbildatauserLoading());
        try {
          await Future.delayed(Duration(seconds: 5),() async{
            hasil=await ambildatauserapi2.hasil2(event.username);
            emit(AmbildatauserSuccess(hasil));
          },);
        } catch (e) {
          emit(AmbildatauserError(e.toString()));
        }
      }
    });
  }
}
