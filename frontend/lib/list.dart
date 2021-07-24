import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPage extends StatelessWidget {
  final String apiUrl = "http://localhost:5000/absen";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(apiUrl);
    print(result.body);
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) { 
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String kerja = snapshot.data[index]["lama_kerja"];
                    
                    return ListTile(
                      title: Text(snapshot.data[index]['nama']),
                      subtitle: Text("EMAIL: " +
                          snapshot.data[index]['email'] +
                          " CHECK IN: " +
                          snapshot.data[index]["check_in"] +
                          " CHECK OUT: " +
                          snapshot.data[index]["check_out"] +
                          " LAMA KERJA: " +
                          snapshot.data[index]["lama_kerja"]),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
