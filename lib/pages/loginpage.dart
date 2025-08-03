

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc2/bloc/loginresponse_bloc.dart';
import 'package:latihanbloc2/pages/dashboard.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/loginapi.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginState();
}

class _loginState extends State<loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginresponseBloc loginresponseBloc = context.read<LoginresponseBloc>();
    return WillPopScope(
      onWillPop: _onbackbutton,
      child: Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: BlocListener<LoginresponseBloc, LoginresponseState>(
          listener: (context, state) {
            if (state is LoginresponseLoaded) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dashboard(state.login[0].username),
              ));
            }
          },
          child: BlocBuilder<LoginresponseBloc, LoginresponseState>(
            builder: (context, state) {
              if (state is LoginresponseLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginresponseError) {
                return Center(
                  child: Text(state.Error),
                );
              } else {
                return Center(
                  child: Container(
                    width: 500,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Silahkan Perbaiki Task Anda",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: pass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "Silahkan Perbaiki Task Anda",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            loginresponseBloc
                                .add(Kirimdata(email.text, pass.text));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text("Insert"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _onbackbutton() async {
    bool? exitapp = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm"),
        content: Text("Are You Sure To Exit App"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Yes")),
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("No"))
        ],
      ),
    );
    return exitapp?? false;
  }
}
