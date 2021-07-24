import 'dart:html';

import 'package:absen_app/model/login_model.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class Account extends StatelessWidget {
  final String datamasuk;
  final String username;
  Account({this.datamasuk, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
            child: Form(
                child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(datamasuk),
                SizedBox(
                  height: 25,
                ),
                Text(username),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Icon(
                    Icons.logout, color: Colors.white,
                  ),
                  color: Colors.redAccent,
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
