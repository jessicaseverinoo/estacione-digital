import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/model/user_model.dart';
import 'package:estacione_digital/src/shared/widgets/menu.dart';
import 'package:estacione_digital/src/view/Home/home_page.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_page.dart';
import 'package:estacione_digital/src/view/Wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  UserModel userModel;

  NavigationPage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _pageOptions() => [
        HomePage(userModel: widget.userModel),
        WalletPage(userModel: widget.userModel),
        VehiclePage(userModel: widget.userModel),
        // AddVehiclePage(),
        Text(
          'Index 4: School',
          style: optionStyle,
        ),
      ];

void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageOptions = _pageOptions();

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sort_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Abrir notificações',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      drawer: const Menu(),
      body: Center(
        child: pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: kCoolGrey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(color: kPrimary),
        selectedIconTheme: const IconThemeData(color: kPrimary),
        unselectedLabelStyle: const TextStyle(color: kCoolGrey),
        items: const <BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimary,
        onTap: _onItemTapped,
      ),
    );
  }
}
