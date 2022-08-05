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
        children: [
          Expanded(
            child: ListView(
              children: [
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'abc-1234',
                    favorite: true),
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'xyz-1111',
                    favorite: false),
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'klj-2314',
                    favorite: false),
                CardItemWidget(
                    vehicleType: 'car',
                    licensePlate: 'vvlk-1986',
                    favorite: false),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Adicionar Veículo'),
          ),
        ],
      ),
    ));
  }
}
