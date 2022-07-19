import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class CardCredit extends StatelessWidget {
  const CardCredit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          color: kGreyLight,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Cartão de crédito'),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: kSteelBlue,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: const Text(
                        'Padrão',
                        style: TextStyle(color: kWhite, fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text('•••• •••• •••• 0123'),
              ],
            ),
          ),
        ),
        TextButton(
            onPressed: () {}, child: const Text('Alterar forma de pagamento'))
      ],
    );
  }
}
