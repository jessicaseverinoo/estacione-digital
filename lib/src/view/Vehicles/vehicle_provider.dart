import 'dart:convert';
import 'package:estacione_digital/src/model/user_model.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:http/http.dart' as http;

class VehiclesProvider {
  Future<List<VehicleModel>> getVehicles(UserModel userModel) async {
    final url = Uri.http('api-estacionamento-digital.herokuapp.com',
        'usuarios/${userModel.uuidUsuario}');

    final header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['listVeiculo'];
      List<VehicleModel> items = body
          .map(
            (dynamic item) => VehicleModel.fromJson(item),
          )
          .toList();

      return items;
    } else {
      throw Exception('Failed to load vehicles.');
    }
  }
}
