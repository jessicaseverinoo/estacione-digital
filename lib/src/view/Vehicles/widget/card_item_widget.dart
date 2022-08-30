import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/view/Vehicles/helpers/list_icons_vehicles.dart';
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
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            listIconsVehicles[vehicleType],
            const SizedBox(
              width: 8,
            ),
            Text(
              licensePlate,
              style: const TextStyle(
                  fontSize: 16, color: kDark, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Icon(Icons.star, color: favorite == true ? kAlert : kDark),
            const SizedBox(
              width: 12,
            ),
            const Icon(Icons.edit, color: kDark),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.delete,
              color: kDanger,
            )
          ],
        ),
      ),
    );
  }
}
