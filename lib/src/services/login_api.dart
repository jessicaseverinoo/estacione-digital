import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String password) async {
    Map params = {"cpfCnpj": user, "senha": password};

    var url = Uri.http('api-estacionamento-digital.herokuapp.com', '/login');
    print(url);

    var header = {"Content-Type": "application/json"};
    print(header);

    var body = convert.jsonEncode(params);
    print(body);

    var response = await http.post(url, headers: header, body: body);

    print('response status: ${response.statusCode}.');
    print('response body: ${response.body}.');

    if(response.statusCode== 200){
      return true;
    }

    return false;
  }
}
