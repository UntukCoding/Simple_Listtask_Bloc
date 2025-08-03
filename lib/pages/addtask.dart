import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:latihanbloc2/bloc/addtasklist_bloc.dart';
import 'package:latihanbloc2/pages/dashboard.dart';

class addtask extends StatefulWidget {
  String username;
  addtask(this.username, {super.key});

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {
  TextEditingController judul = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController waktu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AddtasklistBloc addtasklistBloc = context.read<AddtasklistBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Task Anda"),
      ),
      body: BlocListener<AddtasklistBloc, AddtasklistState>(
        bloc: addtasklistBloc,
        listener: (context, state) {
          if (state is AddtasklistSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => dashboard(widget.username),
            ));
          }
        },
        child: BlocBuilder<AddtasklistBloc, AddtasklistState>(
          builder: (context, state) {
            if (state is AddtasklistLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AddtasklistError) {
              return Center(
                child: Text(state.Error),
              );
            } else {
              return Center(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFF5EBE0), Color(0xFFFFFFD0)])),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: judul,
                              decoration: InputDecoration(
                                  labelText: "Pilih Judul Task Anda",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: keterangan,
                              decoration: InputDecoration(
                                  labelText: "Tentukan Keterangan Anda",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: tanggal,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today_rounded),
                                  labelText: "Select Date",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));
                                if (pickeddate != null) {
                                  tanggal.text = DateFormat('yyyy-MM-dd')
                                      .format(pickeddate);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: waktu,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.timer),
                                  labelText: "Select Time",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onTap: () async {
                                TimeOfDay timeOfDay=TimeOfDay.now();
                                FocusScope.of(context).requestFocus(FocusNode());
                                TimeOfDay? pickeddate=await showTimePicker(context: context, initialTime: timeOfDay);
                                if(pickeddate !=null && pickeddate!=timeOfDay){
                                  waktu.text=timeOfDay.format(context);
                                  setState(() {
                                    timeOfDay=pickeddate;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addtasklistBloc.add(AddtasklistEvent2(
                                  widget.username,
                                  judul.text,
                                  keterangan.text,
                                  tanggal.text,
                                  waktu.text));
                            },
                            child: Text("Tambahkan"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD09CFA),
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
