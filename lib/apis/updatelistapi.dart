import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/updatetaskmodel.dart';

abstract class Updatelistapi {
  Future<MessageSuccessedittask> fetcthdata3kali(
      String id, String judul, String keterangan, String tanggal, String waktu);
}

class Updatelistapi2 extends Updatelistapi {
  @override
  Future<MessageSuccessedittask> fetcthdata3kali(String id, String judul,
      String keterangan, String tanggal, String waktu) async {
    try {
      var url = "http://192.168.0.107/test/edittask.php";
      var response = await http.post(Uri.parse(url), body: {
        "id": id,
        "judul": judul,
        "keterangan": keterangan,
        "tanggal": tanggal,
        "waktu": waktu
      });
      if (response.statusCode == 200) {
        return MessageSuccessedittask.fromJson(jsonDecode(response.body));
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
