import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:latihanbloc2/model/responseapi.dart';
import 'package:meta/meta.dart';

import '../apis/getapi.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  late AutoGenerate autoGenerate;
  final Senddatatoapi senddatatoapi = Senddatatoapi();
  LoginblocBloc() : super(LoginblocInitial()) {
    on<LoginblocEvent>((event, emit) async {
      if (event is Kirimdata) {
        emit(LoginblocLoading());
        try {
          await Future.delayed(Duration(seconds: 5), (() async {
            autoGenerate = await senddatatoapi.fecthdetail(
                event.username, event.email, event.pass, event.pass);
            emit(LoginblocLoaded(autoGenerate));
          }));
        } on Exception catch (e) {
          emit(Loginblocerror(e.toString()));
        }
      }
    });
  }
}
