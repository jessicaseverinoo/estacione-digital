import 'package:flutter/material.dart';

class VehicleController {
  final formKey = GlobalKey<FormState>();
  late bool isSelectedFavorite = false;
  late bool isSelectedTypeVehicleCar = false;
  late bool isSelectedTypeVehicleBuss = false;
  late bool isSelectedTypeVehicleTruck = false;

  TextEditingController placaVeiculoController = TextEditingController();
  TextEditingController modeloVeiculoController = TextEditingController();

  String getTypeVehicle(bool isSelectedTypeVehicleCar,
      bool isSelectedTypeVehicleBuss, bool isSelectedTypeVehicleTruck) {
    if (isSelectedTypeVehicleTruck) {
      return 'CAMINHAO';
    }
    if (isSelectedTypeVehicleCar) {
      return 'CARRO';
    }
    if (isSelectedTypeVehicleBuss) {
      return 'ONIBUS';
    }
    return '';
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }
}
