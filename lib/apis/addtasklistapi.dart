import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/addtaskmodel.dart';
import 'package:latihanbloc2/model/responseapi.dart';

abstract class Addtasklistapi {
  Future<MessageSuccessaddtask> fecthdetail234(String username, String judul, String keterangan,
      String tanggal, String waktu);
}

class Addtasklistapi2 extends Addtasklistapi {
  @override
  Future<MessageSuccessaddtask> fecthdetail234(String username, String judul, String keterangan,
      String tanggal, String waktu) async {
    try {
      var url = "http://192.168.0.107/test/addtask.php";
      var response = await http.post(Uri.parse(url), body: {
        "username": username,
        "judul": judul,
        "keterangan": keterangan,
        "tanggal": tanggal,
        "waktu": waktu
      });
      if (response.statusCode == 200) {
        return MessageSuccessaddtask.fromJson(jsonDecode(response.body));
      }else{
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
