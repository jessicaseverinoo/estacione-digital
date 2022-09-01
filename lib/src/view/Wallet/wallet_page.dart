import 'dart:ui';

import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/view/Wallet/widgets/card_credit.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [kGradientLight, kGradientDark],
                  transform: GradientRotation(20)),
            ),
            child: Column(
              children: const [
                Text(
                  'R\$12,00',
                  style: TextStyle(
                    fontSize: 54,
                    color: kWhite,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Saldo em carteira',
                  style: TextStyle(
                    fontSize: 12,
                    color: kWhite,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CardCredit(),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Comprar Tickets'),
          ),
        ],
      ),
    ));
  }
}
