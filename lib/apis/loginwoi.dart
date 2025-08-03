import 'dart:convert';
import 'dart:io';

import 'package:latihanbloc2/model/loginapi.dart';
import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/logindata.dart';

abstract class Dapatdata {
  Future<List<Login>> fetchdata(String email, String pass);
}

class Dapatdata2 extends Dapatdata {
  @override
  Future<List<Login>> fetchdata(String email, String pass) async {
    try {
      var url = "http://192.168.0.107/test/login.php";
      var response = await http
          .post(Uri.parse(url), body: {"email": email, "password": pass});
      if (response.statusCode == 200) {
        var hasil = Getdatauser.fromJson(jsonDecode(response.body));
        var kedua = hasil.toJson();
        var ketiga =
            (kedua['login'] as List).map((e) => Login.fromJson(e)).toList();
        return ketiga;
      } else {
        throw Exception('Failed to Loaded Success');
      }
    } on SocketException {
      throw Exception('Server Error');
    } on HttpException {
      throw Exception('Somenthing Wrong');
    } on FormatException {
      throw Exception('Bad Request');
    } on Exception catch (e) {
      throw Exception('Failed to make request');
    }
  }
}
