import 'dart:convert';
import 'package:flutter_auth_ui/API/authmodel.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  static Future<AuthModel> getData(String username, String password) async {
    var url = Uri.parse('http://localhost:8000/login/$username/$password/');

    var client = http.Client();
    var data;

    try {
      final response = await client.get(url);
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      data = AuthModel.fromJson(jsonMap);

      return data;
    } catch (Exeption) {
      return data;
    }
  }
}
