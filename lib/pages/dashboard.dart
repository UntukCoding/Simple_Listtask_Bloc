import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc2/bloc/addtasklist_bloc.dart';
import 'package:latihanbloc2/bloc/listask_bloc.dart';
import 'package:latihanbloc2/model/tasklist.dart';
import 'package:latihanbloc2/pages/addtask.dart';
import 'package:latihanbloc2/pages/loginpage.dart';
import 'package:latihanbloc2/pages/tasklistcard.dart';
import 'package:latihanbloc2/support/sidebar.dart';

import '../model/loginapi.dart';

class dashboard extends StatefulWidget {
  String list;
  dashboard(this.list, {super.key});

  @override
  State<dashboard> createState() => _dashboardstate();
}

class _dashboardstate extends State<dashboard> {
  Widget appBartitle = Text("Dashboard");
  Icon actions = Icon(
    Icons.search,
    color: Colors.black,
  );
  List<Hasil> hasil3 = [];
  List<Hasil> hasil2 = [];
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListaskBloc listaskBloc = context.read<ListaskBloc>();
    listaskBloc.add(Sendtata(widget.list));
  }

  @override
  Widget build(BuildContext context) {
    ListaskBloc listaskBloc = context.read<ListaskBloc>();

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: appBartitle,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (this.actions.icon == Icons.search) {
                      this.actions = Icon(
                        Icons.close,
                        color: Colors.black,
                      );
                      this.appBartitle = TextField(
                        controller: search,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            hasil3 = hasil2
                                .where((element) =>
                                    element.judul.contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      );
                    } else {
                      this.actions = Icon(
                        Icons.search,
                        color: Colors.black,
                      );
                      this.appBartitle = Text("Dashboard");
                      setState(() {
                        search.clear();
                      });
                    }
                  });
                },
                icon: actions),
          ],
        ),
        drawer: sidebarmenu(widget.list),
        body: RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        dashboard(widget.list),
                    transitionDuration: Duration(seconds: 0)));
            await listaskBloc;
          },
          child: BlocBuilder<ListaskBloc, ListaskState>(
            bloc: listaskBloc,
            builder: (context, state) {
              if (state is ListaskLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ListaskError) {
                return Center(
                  child: Text(state.Error),
                );
              } else if (state is ListaskLoaded) {
                hasil2 = state.hasil;
                return search.text.isNotEmpty && hasil3.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 75,
                            ),
                            Text("Data Tidak DItemukan"),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Color.fromARGB(255, 108, 108, 108),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: tasklistcard(Hasil(
                                          id: search.text.isNotEmpty
                                              ? hasil3[index].id
                                              : hasil2[index].id,
                                          judul: search.text.isNotEmpty
                                              ? hasil3[index].judul
                                              : hasil2[index].judul,
                                          keterangan: search.text.isNotEmpty
                                              ? hasil3[index].keterangan
                                              : hasil2[index].keterangan,
                                          tanggal: search.text.isNotEmpty
                                              ? hasil3[index].tanggal
                                              : hasil2[index].tanggal,
                                          waktu: search.text.isNotEmpty
                                              ? hasil3[index].waktu
                                              : hasil2[index].waktu)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: search.text.isNotEmpty
                            ? hasil3.length
                            : hasil2.length,
                      );
              }
              return Container();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => addtask(widget.list),
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldPop = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Are you sure you want to log out from this page?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: <Widget>[
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            loginpage(), // Destination
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                InkWell(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ));
    return shouldPop ?? false;
  }
}
