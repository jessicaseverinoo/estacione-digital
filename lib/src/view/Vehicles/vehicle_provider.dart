import 'dart:convert';
import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:http/http.dart';

class VehiclesProvider {
  Future<List<VehicleItem>> getVehicles() async {
    final url = Uri.http('api-estacionamento-digital.herokuapp.com',
        'usuarios/e7963200-2dd8-4a3d-8c7a-8f4c8eaf39bf');
    final header = {"Content-Type": "application/json"};

    Response response = await get(url, headers: header);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['listVeiculo'];
      List<VehicleItem> items = body
          .map(
            (dynamic item) => VehicleItem.fromJson(item),
          )
          .toList();

      return items;
      // return VehicleItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load vehicles.');
    }
  }
}
