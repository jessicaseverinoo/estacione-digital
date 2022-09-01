import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  bool _isSelectedFavorite = false;
  bool _isSelectedTypeVehicle = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Placa do veículo',
            style: TextStyle(color: kCoolGrey, fontSize: 15),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Modelo',
            style: TextStyle(color: kCoolGrey, fontSize: 15),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
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
                    // Toggle light when tapped.
                    _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                  });
                },
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(_isSelectedTypeVehicle
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
                    // Toggle light when tapped.
                    _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                  });
                },
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(_isSelectedTypeVehicle
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
                    // Toggle light when tapped.
                    _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                  });
                },
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(_isSelectedTypeVehicle
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
            onPressed: () {},
            child: const Text('Adicionar Veículo'),
          )
        ],
      ),
    ));
  }
}
