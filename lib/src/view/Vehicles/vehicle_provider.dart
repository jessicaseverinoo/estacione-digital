import 'dart:convert';

import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:http/http.dart' as http;

const API_BASE_URL = 'api-estacionamento-digital.herokuapp.com';
const HEADER = {"Content-Type": "application/json"};

class VehiclesProvider {
  static Future<List<VehicleModel>> getVehicles(String uuidUser) async {
    try {
      final url = Uri.http(API_BASE_URL, 'usuarios/$uuidUser');

      var response = await http.get(url, headers: HEADER);

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
    } catch (error) {
      throw Exception('Failed to load vehicles: $error');
    }
  }

  static Future createVehicles(
      {required String uuidUser, required VehicleModel vehicle}) async {
    try {
      final url = Uri.http(API_BASE_URL, 'usuarios/$uuidUser/veiculos');

      var response = await http.post(
        url,
        headers: HEADER,
        body: jsonEncode(
          <String, dynamic>{
            "placa": vehicle.placa,
            "modelo": vehicle.modelo,
            "favorito": vehicle.favorito,
            "tipoVeiculo": vehicle.tipoVeiculo,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create vehicle');
      }
    } catch (error) {
      throw Exception('Failed to create vehicle $error');
    }
  }

  static Future updateVehicles(
      {required String uuidUser, required VehicleModel vehicle}) async {
    try {
      final url = Uri.http(
          API_BASE_URL, 'usuarios/$uuidUser/veiculos/${vehicle.uuidVeiculo}');

      var response = await http.patch(
        url,
        headers: HEADER,
        body: jsonEncode(
          <String, dynamic>{
            "placa": vehicle.placa,
            "modelo": vehicle.modelo,
            "favorito": vehicle.favorito,
            "tipoVeiculo": vehicle.tipoVeiculo,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update vehicle');
      }
    } catch (error) {
      throw Exception('Failed to update vehicle $error');
    }
  }

  static Future deleteVehicles(
      {required String uuidUser, required String uuidVeiculo}) async {
    try {
      final url =
          Uri.http(API_BASE_URL, 'usuarios/$uuidUser/veiculos/$uuidVeiculo');

      var response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to delete vehicle');
      }
    } catch (error) {
      throw Exception('Failed to delete vehicle $error');
    }
  }
}
