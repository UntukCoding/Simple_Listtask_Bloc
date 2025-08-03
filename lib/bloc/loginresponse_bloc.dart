import 'package:bloc/bloc.dart';
import 'package:latihanbloc2/model/loginapi.dart';
import 'package:latihanbloc2/model/logindata.dart';
import 'package:latihanbloc2/apis/loginwoi.dart';
import 'package:meta/meta.dart';

part 'loginresponse_event.dart';
part 'loginresponse_state.dart';

class LoginresponseBloc extends Bloc<LoginresponseEvent, LoginresponseState> {
  late Login login;
  late List<Login> login2;
  late Getdatauser getdatauser;
  final Dapatdata2 dapatdata2=Dapatdata2();
  LoginresponseBloc() : super(LoginresponseInitial()) {
    on<LoginresponseEvent>((event, emit) async {
      if(event is Kirimdata){
        emit(LoginresponseLoading());
        try {
          await Future.delayed(Duration(seconds: 5),()async {
          login2=await dapatdata2.fetchdata(event.username, event.pass);
          emit(LoginresponseLoaded(login2));
          },);
        } catch (e) {
          emit(LoginresponseError(e.toString()));
        }
      }
    });
  }
}
