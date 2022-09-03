import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  VehicleModel({
    required this.uuidVeiculo,
    required this.placa,
    required this.modelo,
    required this.favorito,
    required this.tipoVeiculo,
  });

  final String uuidVeiculo;
  final String placa;
  final String modelo;
  final bool favorito;
  final String tipoVeiculo;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        uuidVeiculo: json['uuidVeiculo'],
        placa: json['placa'],
        modelo: json['modelo'],
        favorito: json['favorito'],
        tipoVeiculo: json['tipoVeiculo'],
      );

  Map<String, dynamic> toJson() => {
        "uuidVeiculo": uuidVeiculo,
        "placa": placa,
        "modelo": modelo,
        "favorito": favorito,
        "tipoVeiculo": tipoVeiculo,
      };
}
