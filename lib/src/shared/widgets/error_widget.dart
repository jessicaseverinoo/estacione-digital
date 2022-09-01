import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Erro ao carregar a lista',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kDanger,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: kCoolGrey,
          ),
        ),
      ],
    );
  }
}
