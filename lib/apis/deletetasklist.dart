import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanbloc2/model/deletetaskmodel.dart';

abstract class Deletetasklist {
  Future<MessageSuccesdeletetask> deletetask(String id);
}

class Deletetasklist2 extends Deletetasklist {
  @override
  Future<MessageSuccesdeletetask> deletetask(String id) async {
    try {
      var url = "http://192.168.0.107/test/deletetask.php";
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        return MessageSuccesdeletetask.fromJson(jsonDecode(response.body));
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
