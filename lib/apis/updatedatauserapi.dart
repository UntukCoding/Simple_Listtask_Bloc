import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/updatedatausermodel.dart';

abstract class Updatedatauserapi {
  Future<MessageSuccessupdatedatauser> profileuser(String id, String username,
      String email, String pasword, String konfirpassword);
}

class Updatedatauserapi2 extends Updatedatauserapi {
  @override
  Future<MessageSuccessupdatedatauser> profileuser(String id, String username,
      String email, String pasword, String konfirpassword) async {
    try {
      var url = "http://192.168.0.107/test/updatedatauser.php";
      var response = await http.post(Uri.parse(url), body: {
        "id": id,
        "username": username,
        "email": email,
        "password": pasword,
        "konfir": konfirpassword
      });
      if (response.statusCode == 200) {
        return MessageSuccessupdatedatauser.fromJson(jsonDecode(response.body));
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
