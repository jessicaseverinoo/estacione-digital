import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String vehicleType;
  final String licensePlate;
  final bool favorite;

  const CardItemWidget(
      {Key? key,
      required this.vehicleType,
      required this.licensePlate,
      required this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.car_crash),
          const SizedBox(
            width: 8,
          ),
          Text(
            licensePlate,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Icon(Icons.star,
              color: favorite == true ? Colors.amber : Colors.grey),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.edit),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.restore_from_trash)
        ],
      ),
    );
  }
}
