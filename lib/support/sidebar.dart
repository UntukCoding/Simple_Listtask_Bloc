import 'package:flutter/material.dart';
import 'package:latihanbloc2/pages/dashboard.dart';
import 'package:latihanbloc2/pages/profileupdate.dart';

class sidebarmenu extends StatefulWidget {
  String username;
  sidebarmenu(this.username, {super.key});

  @override
  State<sidebarmenu> createState() => _sidebarmenuState();
}

class _sidebarmenuState extends State<sidebarmenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildheader(context), buildmenu(context)],
        ),
      ),
    );
  }

  Widget buildheader(BuildContext context) {
    return Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("lib/image/191471.png"),
              ),
              SizedBox(
                height: 12,
              ),
              Text(widget.username),
              Text("sdfsdfdsfsdfsdfsdf"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildmenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => dashboard(widget.username),
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => profileupdate(widget.username),
            )),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              
            },
          )
        ],
      ),
    );
  }
}
