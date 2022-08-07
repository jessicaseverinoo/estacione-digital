import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  bool _flutter = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Placa do veículo',
            style: TextStyle(color: kCoolGrey, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Modelo',
            style: TextStyle(color: kCoolGrey, fontSize: 15),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SwitchListTile(
            title: Text(
              'Favorito',
              style: TextStyle(color: kCoolGrey, fontSize: 15),
            ),
            value: _flutter,
            activeColor: Colors.red,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool value) {
              setState(() {
                _flutter = value;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Tipo de veículo',
            style: TextStyle(color: kCoolGrey, fontSize: 15),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.car_crash, size: 56),
              Icon(Icons.car_crash, size: 56),
              Icon(Icons.car_crash, size: 56),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Adicionar Veículo'),
          )
        ],
      ),
    ));
  }
}
