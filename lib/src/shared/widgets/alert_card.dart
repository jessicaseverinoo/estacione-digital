import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final Color color;
  final dynamic prefixingIcon;
  final dynamic sufixIcon;
  final String title;
  final String text;

  const AlertCard(
      {Key? key,
      required this.color,
      required this.prefixingIcon,
      required this.sufixIcon,
      required this.title,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(prefixingIcon, color: color),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Icon(sufixIcon, color: color),
              ],
            ),
            const SizedBox(height: 12),
            Text(text),
          ],
        ),
      ),
    );
  }
}
