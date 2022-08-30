import 'package:estacione_digital/src/view/Vehicles/add_vehicle_page.dart';
import 'package:estacione_digital/src/view/Vehicles/widget/card_item_widget.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: const [
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'abc-1234',
                    favorite: true),
                SizedBox(height: 12),
                CardItemWidget(
                    vehicleType: 'truck',
                    licensePlate: 'xyz-1111',
                    favorite: false),
                SizedBox(height: 12),
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'klj-2314',
                    favorite: false),
                SizedBox(height: 12),
                CardItemWidget(
                    vehicleType: 'buss',
                    licensePlate: 'vvlk-1986',
                    favorite: false),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddVehiclePage(),
                ),
              );
            },
            child: const Text('Adicionar Veículo'),
          )
        ],
      ),
    ));
  }
}
