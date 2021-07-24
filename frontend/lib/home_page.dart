import 'package:absen_app/login_page.dart';
import 'package:flutter/material.dart';
import 'home.dart' as home;
import 'list.dart' as list;
import 'account.dart' as account;

class HomePage extends StatefulWidget {
  final String emailkirim;
  final String nama;
  HomePage({this.emailkirim, this.nama});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Ayo Absen",
            style: TextStyle(color: Colors.white, fontFamily: 'popins'),
          ),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        ),
        body: new TabBarView(
          controller: controller,
          children: [
            new home.Home(datamasuk : widget.emailkirim, username: widget.nama),
            new list.ListPage(),
            new account.Account(datamasuk : widget.emailkirim, username: widget.nama),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.redAccent,
          child: new TabBar(controller: controller, tabs: [
            new Tab(
              icon: new Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.people,
                color: Colors.white,
              ),
            ),
          ]),
        ));
  }
}
