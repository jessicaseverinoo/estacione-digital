import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Card(),
        Card(),
        Card(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {}, child: Text('Adicionar Veículo')),
        ),
      ],
    ));
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 63,
        decoration: BoxDecoration(
          color: kGreyLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.car_crash),
            Text(
              'abc-1234',
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.star),
            Icon(Icons.edit),
            Icon(Icons.restore_from_trash)
          ],
        ),
      ),
    );
  }
}
