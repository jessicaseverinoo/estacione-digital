import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String vehicleType;
  final String licensePlate;
  final bool favorite;

  const CardItemWidget({Key? key, required this.vehicleType, required this.licensePlate, required this.favorite}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.car_crash),
            const SizedBox(width: 8,),
            Text(
              licensePlate,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Icon(Icons.star,color: favorite == true ? Colors.amber: Colors.grey),
            const SizedBox(width: 8,),
            Icon(Icons.edit),
            const SizedBox(width: 8,),
            Icon(Icons.restore_from_trash)
          ],
        ),
      ),
    );
  }
}