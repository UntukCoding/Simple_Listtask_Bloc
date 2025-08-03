import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc2/bloc/deletetasklist_bloc.dart';
import 'package:latihanbloc2/model/tasklist.dart';
import 'package:latihanbloc2/pages/edittask.dart';

class tasklistcard extends StatelessWidget {
  Hasil hasil;
  tasklistcard(this.hasil, {super.key});

  @override
  Widget build(BuildContext context) {
    BuildContext dialogcontext;
    return Material(
      shadowColor: Color.fromARGB(255, 167, 167, 167),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context2) {
              dialogcontext = context2;
              return AlertDialog(
                title: Text('Pilihan'),
                content: Text("Mengedit Task Anda"),
                actions: [
                  TextButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return edittask(hasil);
                          },
                        ));
                        Navigator.pop(dialogcontext);
                      },
                      child: Text("Edit")),
                  TextButton(
                      onPressed: () => Navigator.pop(context, "Cancel"),
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () async{
                        await showDialog(
                            context: context,
                            builder: (context) => BlocListener<
                                    DeletetasklistBloc, DeletetasklistState>(
                                  listener: (context, state) {
                                    if(state is DeletetasklistSuccess){
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: BlocBuilder<DeletetasklistBloc,
                                      DeletetasklistState>(
                                    builder: (context, state) {
                                      if (state is DeletetasklistLoading) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (state is DeletetasklistError) {
                                        return Center(
                                          child: Text(state.Error),
                                        );
                                      }
                                      return AlertDialog(
                                        content: Text(
                                            'Apa Anda Yakin Menghapus Task Ini?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () async{
                                                BlocProvider.of<
                                                            DeletetasklistBloc>(
                                                        context)
                                                    .add(DeletetasklistEvent2(
                                                        hasil.id));
                                               
                                              },
                                              child: Text("ya")),
                                          TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Tidak'),
                                              child: Text("Tidak")),
                                        ],
                                      );
                                    },
                                  ),
                                ));
                        Navigator.pop(context);
                      },
                      child: Text("Delete")),
                ],
              );
            },
          );
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 75,
                  child: Column(
                    children: [
                      Text(
                        hasil.judul,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.only(right: 75, top: 15),
                  child: Column(
                    children: [
                      Text(hasil.keterangan,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        hasil.tanggal,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        hasil.waktu,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
