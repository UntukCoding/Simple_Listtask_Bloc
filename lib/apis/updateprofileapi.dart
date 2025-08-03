import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:latihanbloc2/model/updatefotoprofilemodel.dart';

abstract class Updatefotoprofileapi{
  Future<MessageSuccessupdatefotoprofile> updatefoto(File fotoprofile,String username);
}

class Updatefotoprofileapi2 extends Updatefotoprofileapi{
  @override
  Future<MessageSuccessupdatefotoprofile> updatefoto(File fotoprofile, String username) async{
    try {
      var url="http://192.168.0.107/test/uploadprofileuser.php";
      var response=await http.MultipartRequest("POST",Uri.parse(url));
      response.fields['username']=username;
      var pic=await http.MultipartFile.fromPath("file", fotoprofile.path);
      response.files.add(pic);
      var hasil=await response.send();
      var data=await http.Response.fromStream(hasil);
      if(data.statusCode==200){
        return MessageSuccessupdatefotoprofile.fromJson(jsonDecode(data.body));
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