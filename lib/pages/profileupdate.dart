import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihanbloc2/bloc/ambildatauser_bloc.dart';
import 'package:latihanbloc2/bloc/updatedatauser_bloc.dart';
import 'package:latihanbloc2/bloc/updatefotoprofile_bloc.dart';
import 'package:latihanbloc2/model/ambildatausermodel.dart';
import 'package:latihanbloc2/support/sidebar.dart';
import 'dart:io';

class profileupdate extends StatefulWidget {
  String username;
  profileupdate(this.username, {super.key});

  @override
  State<profileupdate> createState() => _profileupdateState();
}

class _profileupdateState extends State<profileupdate> {
  bool isobsecurepassword = true;
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController konfir = TextEditingController();
  TextEditingController id = TextEditingController();
  List<Hasil2> gethasil = [];
  ImagePicker imagePicker = ImagePicker();
  File? image2;
  @override
  void initState() {
    super.initState();
    AmbildatauserBloc ambildatauserBloc = context.read<AmbildatauserBloc>();
    ambildatauserBloc.add(AmbildatauserEvent2(widget.username));
  }

  pilihkamera() async {
    var pick = await imagePicker.pickImage(source: ImageSource.camera);
    if (pick == null) return;
    setState(() {
      image2 = File(pick.path);
    });
  }

  pilihgalery() async {
    var pick = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pick == null) return;
    setState(() {
      image2 = File(pick.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    UpdatedatauserBloc updatedatauserBloc = context.read<UpdatedatauserBloc>();
    UpdatefotoprofileBloc updatefotoprofileBloc =
        context.read<UpdatefotoprofileBloc>();
    BuildContext dialogcontext;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: sidebarmenu(widget.username),
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      profileupdate(
                        widget.username,
                      ),
                  transitionDuration: Duration(seconds: 0)));
          await context.read<AmbildatauserBloc>();
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: BlocBuilder<AmbildatauserBloc, AmbildatauserState>(
              bloc: BlocProvider.of<AmbildatauserBloc>(context),
              builder: (context, state) {
                if (state is AmbildatauserLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AmbildatauserError) {
                  return Center(
                    child: Text(state.Error),
                  );
                } else if (state is AmbildatauserSuccess) {
                  gethasil = state.hasil2;
                  id.text = gethasil[0].id;
                  user.text = gethasil[0].username;
                  email.text = gethasil[0].email;
                  pass.text = gethasil[0].password;
                  konfir.text = gethasil[0].password;
                  return Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        color: Colors.black.withOpacity(0.1))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "http://192.168.0.107/test/image/${gethasil[0].profileuser}"))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 4, color: Colors.white),
                                      color: Colors.blue),
                                  child: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return BlocListener<
                                                  UpdatefotoprofileBloc,
                                                  UpdatefotoprofileState>(
                                              listener: (context, state) {
                                            if (state
                                                is UpdatefotoprofileSuccess) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          profileupdate(
                                                            widget.username,
                                                          ),
                                                      transitionDuration:
                                                          Duration(
                                                              seconds: 0)));
                                              context.read<AmbildatauserBloc>();
                                            }
                                          }, child: BlocBuilder<
                                                  UpdatefotoprofileBloc,
                                                  UpdatefotoprofileState>(
                                            builder: (context, state) {
                                              if (state
                                                  is UpdatefotoprofileLoading) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else if (state
                                                  is UpdatefotoprofilError) {
                                                return Center(
                                                  child: Text(state.Error),
                                                );
                                              }
                                              return AlertDialog(
                                                title: Text("Upload Gambar"),
                                                content: Text(
                                                    "Silahkan Pilih Gambar anda"),
                                                actions: [
                                                  Center(
                                                    child: Column(
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      "Silahkan pilih gambar anda"),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await pilihgalery();
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          "Gallery"),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await pilihkamera();
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          "Camera"),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                              "Upload Gambar Anda"),
                                                        ),
                                                        Container(
                                                          width: 300,
                                                          height: 300,
                                                          color: Colors.grey,
                                                          child: image2 != null
                                                              ? Image.file(
                                                                  image2!)
                                                              : Text(
                                                                  "No Image Selected"),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                updatefotoprofileBloc.add(
                                                                    UpdatefotoprofileEvent2(
                                                                        image2!,
                                                                        user.text));
                                                              },
                                                              child: Text("Ya"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text("Tidak"),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ));
                                        },
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      buildidfiled("", "", false),
                      builduserfiled(
                          "Username", "Isi Username Baru Anda", false),
                      buildemailfiled("Email", "Isi Email Baru Anda", false),
                      buildpassfiled("Password", "Buat Password Anda", true),
                      buildkonfirfiled(
                          "Konfirm password", "Konfirm Password Anda", true),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context2) {
                                  dialogcontext = context2;
                                  return BlocListener<UpdatedatauserBloc,
                                      UpdatedatauserState>(
                                    bloc: updatedatauserBloc,
                                    listener: (context, state) {
                                      if (state is UpdatedatauserSuccess) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              profileupdate(user.text),
                                        ));
                                      }
                                    },
                                    child: BlocBuilder<UpdatedatauserBloc,
                                        UpdatedatauserState>(
                                      bloc: updatedatauserBloc,
                                      builder: (context, state) {
                                        if (state is UpdatedatauserLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state
                                            is UpdatedatauserError) {
                                          return Center(
                                            child: Text(state.Error),
                                          );
                                        }

                                        return AlertDialog(
                                          title: Text("Update"),
                                          content: Text(
                                              "Apakah Anda Yakin Mengubah Profil Anda"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                updatedatauserBloc.add(
                                                    UpdatedatauserEvent2(
                                                        gethasil[0].id,
                                                        user.text,
                                                        email.text,
                                                        pass.text,
                                                        konfir.text));
                                              },
                                              child: Text("Ya"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(dialogcontext);
                                              },
                                              child: Text("Tidak"),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildidfiled(
      String labeltext, String placeholder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobsecurepassword : false,
        controller: id,
        enabled: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            suffixIcon: ispasswordtextfield
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isobsecurepassword = !isobsecurepassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget builduserfiled(
      String labeltext, String placeholder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobsecurepassword : false,
        controller: user,
        decoration: InputDecoration(
            suffixIcon: ispasswordtextfield
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isobsecurepassword = !isobsecurepassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildemailfiled(
      String labeltext, String placeholder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobsecurepassword : false,
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            suffixIcon: ispasswordtextfield
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isobsecurepassword = !isobsecurepassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildpassfiled(
      String labeltext, String placeholder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobsecurepassword : false,
        controller: pass,
        decoration: InputDecoration(
            suffixIcon: ispasswordtextfield
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isobsecurepassword = !isobsecurepassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildkonfirfiled(
      String labeltext, String placeholder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobsecurepassword : false,
        controller: konfir,
        decoration: InputDecoration(
            suffixIcon: ispasswordtextfield
                ? IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isobsecurepassword = !isobsecurepassword;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
