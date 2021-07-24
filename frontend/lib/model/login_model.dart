class LoginResponseModel {
  
  final String password;
  final String nama;
  final String checkin;
 

  LoginResponseModel({this.password, this.nama, this.checkin});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        nama: json["nama"],
        password: json["password"],
        checkin: json["checkIn"]
        );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

class DaftarResponseModel {
  final String email;
  final String password;
 

  DaftarResponseModel({this.email,this.password});

  factory DaftarResponseModel.fromJson(Map<String, dynamic> json) {
    return DaftarResponseModel(
        email: json['email'],
        password: json['password']
        );
  }
}

