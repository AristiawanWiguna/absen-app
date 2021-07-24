import 'dart:async';

import 'package:absen_app/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
    String url = "http://localhost:5000/daftar/"+requestModel.email;
    
    final response = await http.get(url);
    if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
  }
}

class TampilApi{
  Future<DaftarResponseModel> daftar() async{
    String url = "http://localhost:5000/daftar/dika@gmail.com";
    
    final response = await http.get(url);
    if(response.statusCode == 200 || response.statusCode == 400){
      return DaftarResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
  }
}

