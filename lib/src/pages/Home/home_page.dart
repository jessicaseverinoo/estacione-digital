import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:estacione_digital/src/shared/widgets/alert_card.dart';
import 'package:estacione_digital/src/pages/Home/widgets/bottom_sheet_tickets.dart';
import 'package:estacione_digital/src/pages/Home/widgets/timer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;

  const HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Usuario usuario;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Text('Olá, ${widget.userModel.nome}'),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.network(
                  'https://github.com/jessicaseverinoo.png',
                  height: 48,
                  width: 48,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kIndependence,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/icon-timer.png'),
                  height: 70,
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Você tem 2 horas',
                      style: TextStyle(color: kWhite),
                    ),
                    Text(
                      'disponíveis para utilizar',
                      style: TextStyle(color: kWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const AlertCard(
            color: kAlert,
            prefixingIcon: Icons.warning_rounded,
            sufixIcon: Icons.close_rounded,
            title: 'Fique atento',
            text:
                'Para mais informações de uso e esclarecimentos sobre fracionamento, tolerância e pós-utilização, clique aqui.',
          ),
          const SizedBox(height: 12),
          const AlertCard(
            color: kCian,
            prefixingIcon: Icons.timer_rounded,
            sufixIcon: Icons.push_pin_outlined,
            title: 'Horário de funcionamento',
            text:
                'Para mais informações de uso e esclarecimentos sobre fracionamento, tolerância e pós-utilização, clique aqui.',
          ),
          const SizedBox(height: 12),
          const Timer(),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const BottomSheetTickets();
                },
              );
            },
            child: const Text('Utilizar tickets'),
          ),
        ],
      ),
    );
  }
}
