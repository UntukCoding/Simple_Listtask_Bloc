import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:latihanbloc2/bloc/updatetasklist_bloc.dart';
import 'package:latihanbloc2/model/tasklist.dart';
import 'package:latihanbloc2/pages/tasklistcard.dart';

class edittask extends StatefulWidget {
  Hasil hasil;
  edittask(this.hasil, {super.key});

  @override
  State<edittask> createState() => _edittaskState();
}

class _edittaskState extends State<edittask> {
  TextEditingController judul = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController waktu = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    judul.text = widget.hasil.judul;
    keterangan.text = widget.hasil.keterangan;
    tanggal.text = widget.hasil.tanggal;
    waktu.text = widget.hasil.waktu;
  }

  @override
  Widget build(BuildContext context) {
    UpdatetasklistBloc updatetasklistBloc = context.read<UpdatetasklistBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Jadwal Anda"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green.shade100, Colors.purple.shade900]),
        ),
        child: BlocListener<UpdatetasklistBloc, UpdatetasklistState>(
          listener: (context, state) {
            if (state is UpdatetasklistSuccess) {
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<UpdatetasklistBloc, UpdatetasklistState>(
            builder: (context, state) {
              if (state is UpdatetasklisLoaded) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UpdatetasklistError) {
                return Center(
                  child: Text(state.Error),
                );
              } else {
                return SingleChildScrollView(
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
                              labelText: "Silahkan Perbaiki Task Anda",
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
                              labelText: "Silahkan Perbaiki Task Anda",
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
                              tanggal.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
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
                            TimeOfDay timeOfDay = TimeOfDay.now();
                            FocusScope.of(context).requestFocus(FocusNode());
                            TimeOfDay? pickeddate = await showTimePicker(
                                context: context, initialTime: timeOfDay);
                            if (pickeddate != null && pickeddate != timeOfDay) {
                              waktu.text = timeOfDay.format(context);
                              setState(() {
                                timeOfDay = pickeddate;
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
                          updatetasklistBloc.add(UpdatetasklistEvent2(
                              widget.hasil.id,
                              judul.text,
                              keterangan.text,
                              tanggal.text,
                              waktu.text));
                        },
                        child: Text("Update"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD09CFA),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
