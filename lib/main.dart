import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc2/bloc/addtasklist_bloc.dart';
import 'package:latihanbloc2/bloc/ambildatauser_bloc.dart';
import 'package:latihanbloc2/bloc/deletetasklist_bloc.dart';

import 'package:latihanbloc2/bloc/listask_bloc.dart';
import 'package:latihanbloc2/bloc/loginbloc_bloc.dart';
import 'package:latihanbloc2/bloc/loginresponse_bloc.dart';
import 'package:latihanbloc2/bloc/updatedatauser_bloc.dart';
import 'package:latihanbloc2/bloc/updatefotoprofile_bloc.dart';
import 'package:latihanbloc2/bloc/updatetasklist_bloc.dart';
import 'package:latihanbloc2/pages/loginpage.dart';

import 'package:latihanbloc2/pages/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginblocBloc>(
            create: (context) => LoginblocBloc(),
            lazy: false,
          ),
          BlocProvider<LoginresponseBloc>(
            create: (context) => LoginresponseBloc(),
            lazy: false,
          ),
          BlocProvider<ListaskBloc>(
            create: (context) => ListaskBloc(),
            lazy: false,
          ),
          BlocProvider<AddtasklistBloc>(
            create: (context) => AddtasklistBloc(),
            lazy: false,
          ),
          BlocProvider<UpdatetasklistBloc>(
            create: (context) => UpdatetasklistBloc(),
            lazy: false,
          ),
          BlocProvider<DeletetasklistBloc>(
            create: (context) => DeletetasklistBloc(),
            lazy: false,
          ),
          BlocProvider<AmbildatauserBloc>(
            create: (context) => AmbildatauserBloc(),
            lazy: false,
          ),
          BlocProvider<UpdatedatauserBloc>(
            create: (context) => UpdatedatauserBloc(),
            lazy: false,
          ),
          BlocProvider<UpdatefotoprofileBloc>(
            create: (context) => UpdatefotoprofileBloc(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Check Login",
            home: loginpage()));
  }
}
