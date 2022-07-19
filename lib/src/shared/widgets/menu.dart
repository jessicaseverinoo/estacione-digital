import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 48,
                    color: kWhite,
                  ),
                  onPressed: () => Navigator.pop(context),
                )),
            ListTile(
              title: const Text('Pagamento de taxas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tickets por veículos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Política de Privacidade'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fale Conosco'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sobre Nós'),
              onTap: () {
                Navigator.pop(context);
              },
              textColor: kWhite,
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
              },
              textColor: kWhite,
            ),
          ],
        ),
      ),
    );
  }
}
