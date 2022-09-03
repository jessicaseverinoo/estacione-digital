import 'dart:convert' as convert;

import 'package:estacione_digital/src/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<UserModel?> login(String user, String password) async {
    Map params = {"cpfCnpj": user, "senha": password};

    final url = Uri.http('api-estacionamento-digital.herokuapp.com', '/login');

    final header = {"Content-Type": "application/json"};

    var body = convert.jsonEncode(params);

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(convert.jsonDecode(response.body));
    }
    return null;
  }
}
