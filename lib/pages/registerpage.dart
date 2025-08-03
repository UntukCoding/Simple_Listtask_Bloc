import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latihanbloc2/bloc/loginbloc_bloc.dart';
import 'package:latihanbloc2/pages/loginpage.dart';

import 'package:latihanbloc2/pages/registerpage.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerState();
}

class _registerState extends State<registerpage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController konfir = TextEditingController();
    LoginblocBloc loginblocBloc = context.read<LoginblocBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.greenAccent,
      ),
      body: BlocConsumer<LoginblocBloc, LoginblocState>(
        listener: (context, state) {
          if (state is LoginblocLoaded) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Registrasion Successs"),
                icon: Icon(Icons.scuba_diving),
                actions: [
                  TextButton(
                      onPressed: (() =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => loginpage(),
                          ))),
                      child: Text("Login")),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder(
            bloc: loginblocBloc,
            builder: (context, state) {
              if (state is LoginblocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loginblocerror) {
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
                            controller: user,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: "Silahkan Perbaiki Task Anda",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: konfir,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "Silahkan Perbaiki Task Anda",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            BlocProvider.of<LoginblocBloc>(context).add(
                                Kirimdata(user.text, email.text, pass.text,
                                    konfir.text));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text("Insert"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
