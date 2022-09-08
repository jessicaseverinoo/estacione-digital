import 'package:estacione_digital/src/models/user_model.dart';
import 'package:estacione_digital/src/pages/Home/home_page.dart';
import 'package:estacione_digital/src/pages/Profile/profile_page.dart';
import 'package:estacione_digital/src/pages/Vehicles/vehicle_page.dart';
import 'package:estacione_digital/src/pages/Wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class NavigationController {
  late int selectedIndex = 0;

  List<Widget> pageOptions(UserModel userModel) => [
        HomePage(userModel: userModel),
        WalletPage(userModel: userModel),
        VehiclePage(userModel: userModel),
        ProfilePage(userModel: userModel),
      ];

  Map<int, String> titlePages = {
    0: "Início",
    1: "Carteira",
    2: "Veículos",
    3: "Perfil"
  };

  List<BottomNavigationBarItem> barItem() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: 'Início',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.payment_rounded),
        label: 'Carteira',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.commute_rounded),
        label: 'Veículos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ];
  }
}
