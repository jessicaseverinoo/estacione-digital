import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String password) async {

    Map params = {"cpfCnpj": user, "senha": password};

    var url = Uri.http('api-estacionamento-digital.herokuapp.com', '/login');

    var header = {"Content-Type": "application/json"};

    var body = convert.jsonEncode(params);

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
