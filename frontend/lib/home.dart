import 'dart:async';
import 'dart:convert';
import 'package:absen_app/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String datamasuk;
  final String username;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Home({this.datamasuk, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text(datamasuk)),
            FlatButton(
              onPressed: () {
                checkAbsen(datamasuk, username).then((value){
                  if(value.checkin != "1"){
                    checkIn(datamasuk, username);
                    final snackBar = SnackBar(
                          content: Text("Check In Successfull"),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                  }else{
                    final snackBar = SnackBar(
                          content: Text("Check In Failed"),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                  }  
                });
              }, 
              child: Text("Check In", style: new TextStyle(color: Colors.white),),
              color: Colors.green,
              ),
            FlatButton(
              onPressed: () {
                checkAbsen(datamasuk, username).then((value){
                  if(value.checkin == "1"){
                    checkOut(datamasuk, username);
                    final snackBar = SnackBar(
                          content: Text("Check Out Successfull"),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                  }else{
                    final snackBar = SnackBar(
                          content: Text("Check Out Failed"),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                  }  
                });
              }, 
              child: Text("Check Out", style: new TextStyle(color: Colors.white),),
              color: Colors.red,
              )
          ],
        ),
    );
  }
}

Future<void> checkIn(email, nama) async {
  String mail = email;
  String name = nama;
  final response = await http.get(
    'http://localhost/absen-app/checkin.php?email='+mail+'&nama='+name,
  );
}

Future<void> checkOut(email, nama) async {
  String mail = email;
  String name = nama;
  final response = await http.get(
    'http://localhost/absen-app/checkout.php?email='+mail,
  );
}

Future<LoginResponseModel> checkAbsen(email, nama) async {
  String mail = email;
  final response = await http.get(
    'http://localhost:5000/daftar/'+email,
  );
   if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
}