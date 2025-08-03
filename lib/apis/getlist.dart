import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/tasklist.dart';

abstract class Dapatlist {
  Future<List<Hasil>> getdata2kali(String username);
}

class Dapatlist2 extends Dapatlist {
  @override
  Future<List<Hasil>> getdata2kali(String username) async {
    try {
      var url = "http://192.168.0.107/test/tasklist.php";
      var response =
          await http.post(Uri.parse(url), body: {"username": username});
      if (response.statusCode == 200) {
        var kedua = Getdatauser2.fromJson(jsonDecode(response.body));
        var ketiga = kedua.toJson();
        var hasil =
            (ketiga['hasil'] as List).map((e) => Hasil.fromJson(e)).toList();
        return hasil;
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
