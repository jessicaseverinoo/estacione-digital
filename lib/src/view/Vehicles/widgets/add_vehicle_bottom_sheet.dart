import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddVehicleBottomSheet extends StatefulWidget {
  final String uuidUser;

  const AddVehicleBottomSheet({Key? key, required this.uuidUser})
      : super(key: key);

  @override
  State<AddVehicleBottomSheet> createState() => _AddVehicleBottomSheetState();
}

class _AddVehicleBottomSheetState extends State<AddVehicleBottomSheet> {
  bool _isSelectedFavorite = false;
  bool _isSelectedTypeVehicleCar = false;
  bool _isSelectedTypeVehicleBuss = false;
  bool _isSelectedTypeVehicleTruck = false;

  TextEditingController placaVeiculoController = TextEditingController();
  TextEditingController modeloVeiculoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final VehicleProvider vehicleProvider = Provider.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 16,
        top: 48,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Placa do veículo',
                style: TextStyle(color: kCoolGrey, fontSize: 15),
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a placa do veículo';
                  }
                  return null;
                },
                controller: placaVeiculoController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: 'XXX-0000',
                ),
                keyboardType: TextInputType.text,
                cursorColor: Colors.black12,
              ),
              const SizedBox(height: 16),
              const Text(
                'Modelo',
                style: TextStyle(color: kCoolGrey, fontSize: 15),
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a placa do veículo';
                  }
                  return null;
                },
                controller: modeloVeiculoController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: 'Ex.: HB20',
                ),
                keyboardType: TextInputType.text,
                cursorColor: Colors.black12,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text(
                    'Favorito',
                    style: TextStyle(color: kCoolGrey, fontSize: 15),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _isSelectedFavorite,
                    onChanged: (bool value) {
                      setState(() {
                        _isSelectedFavorite = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Tipo de veículo',
                style: TextStyle(color: kCoolGrey, fontSize: 15),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelectedTypeVehicleCar = !_isSelectedTypeVehicleCar;
                        _isSelectedTypeVehicleBuss = false;
                        _isSelectedTypeVehicleTruck = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(_isSelectedTypeVehicleCar
                              ? 'assets/icons/car_on.png'
                              : 'assets/icons/car_off.png'),
                          height: 64,
                          width: 64,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelectedTypeVehicleTruck =
                            !_isSelectedTypeVehicleTruck;
                        _isSelectedTypeVehicleCar = false;
                        _isSelectedTypeVehicleBuss = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(_isSelectedTypeVehicleTruck
                              ? 'assets/icons/truck_on.png'
                              : 'assets/icons/truck_off.png'),
                          height: 64,
                          width: 64,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelectedTypeVehicleBuss =
                            !_isSelectedTypeVehicleBuss;
                        _isSelectedTypeVehicleCar = false;
                        _isSelectedTypeVehicleTruck = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(_isSelectedTypeVehicleBuss
                              ? 'assets/icons/buss_on.png'
                              : 'assets/icons/buss_off.png'),
                          height: 64,
                          width: 64,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  VehicleModel payload = VehicleModel(
                    uuidVeiculo: widget.uuidUser,
                    placa: placaVeiculoController.text,
                    modelo: modeloVeiculoController.text,
                    favorito: _isSelectedFavorite,
                    tipoVeiculo: _getTypeVehicle(
                        _isSelectedTypeVehicleCar,
                        _isSelectedTypeVehicleBuss,
                        _isSelectedTypeVehicleTruck),
                  );

                  if (_formKey.currentState!.validate()) {
                    final addVehicle = await vehicleProvider.createVehicles(
                      uuidUser: widget.uuidUser,
                      vehicle: payload,
                    );

                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      vehicleProvider.getVehicles(widget.uuidUser);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao adicionar veículo'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Confirmar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getTypeVehicle(bool isSelectedTypeVehicleCar,
      bool isSelectedTypeVehicleBuss, bool isSelectedTypeVehicleTruck) {
    if (_isSelectedTypeVehicleTruck) {
      return 'CAMINHAO';
    }
    if (_isSelectedTypeVehicleCar) {
      return 'CARRO';
    }
    if (_isSelectedTypeVehicleBuss) {
      return 'ONIBUS';
    }
    return '';
  }
}
