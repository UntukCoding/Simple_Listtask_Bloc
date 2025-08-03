import 'package:latihanbloc2/model/loginapi.dart';

class Getdatauser {
    Getdatauser({
        required this.login,
        required this.success,
        required this.message,
    });

    final List<Login> login;
    final String success;
    final String message;

    factory Getdatauser.fromJson(Map<String, dynamic> json) => Getdatauser(
        login: List<Login>.from(json["login"].map((x) => Login.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "login": List<dynamic>.from(login.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}
