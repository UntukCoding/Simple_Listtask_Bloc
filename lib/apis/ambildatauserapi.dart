import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/ambildatausermodel.dart';

abstract class Ambildatauserapi {
  Future<List<Hasil2>> hasil2(String username);
}

class Ambildatauserapi2 extends Ambildatauserapi {
  @override
  Future<List<Hasil2>> hasil2(String username) async {
    try {
      var url = "http://192.168.0.107/test/ambildatauser.php";
      var response =
          await http.post(Uri.parse(url), body: {"username": username});
      if (response.statusCode == 200) {
        var data = Ambildatauser.fromJson(jsonDecode(response.body));
        var datahasil = data.toJson();
        var konvert = (datahasil['hasil'] as List)
            .map((e) => Hasil2.fromJson(e))
            .toList();
        return konvert;
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
