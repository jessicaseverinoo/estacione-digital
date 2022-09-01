// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;

// class ListVehicleApi {
//   static Future getListVehicles() async {
//     final url = Uri.http('api-estacionamento-digital.herokuapp.com',
//         'usuarios/e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf');
//     final header = {"Content-Type": "application/json"};

//     final response = await http.get(url, headers: header);

//     print(convert.jsonDecode(response.body)['uuidVeiculo']);

//     if (response.statusCode == 200) {
//       print(convert.jsonDecode(response.body));
//       return convert.jsonDecode(response.body);
//     }

//     return convert.jsonDecode(response.body);
//   }
// }
