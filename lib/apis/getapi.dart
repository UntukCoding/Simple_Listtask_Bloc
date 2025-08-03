import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/responseapi.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Dapatapi {
  Future<AutoGenerate> fecthdetail(
      String username, String email, String pass, String konfir);
}

class Senddatatoapi extends Dapatapi {
  @override
  Future<AutoGenerate> fecthdetail(
      String username, String email, String pass, String konfir) async {
    try {
      var url = "http://192.168.0.107/test/register.php";
      var response = await http.post(Uri.parse(url), body: {
        "username": username,
        "email": email,
        "password": pass,
        "konfir": konfir
      });
      if (response.statusCode == 200) {
        return AutoGenerate.fromJson(jsonDecode(response.body));
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
