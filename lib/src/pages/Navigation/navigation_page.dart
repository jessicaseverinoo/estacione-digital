import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/pages/Navigation/navigation_controller.dart';
import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:estacione_digital/src/shared/widgets/menu.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final UserModel userModel;

  const NavigationPage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final controller = NavigationController();

  void _onItemTapped(int index) {
    setState(() {
      controller.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageOptions = controller.pageOptions(widget.userModel);

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
        title: Text(controller.titlePages[controller.selectedIndex].toString()),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Abrir notificações',
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Menu(),
      body: Center(
        child: pageOptions.elementAt(controller.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: kCoolGrey,
        selectedLabelStyle: const TextStyle(color: kPrimary),
        selectedIconTheme: const IconThemeData(color: kPrimary),
        unselectedLabelStyle: const TextStyle(color: kCoolGrey),
        currentIndex: controller.selectedIndex,
        selectedItemColor: kPrimary,
        onTap: _onItemTapped,
        items: controller.barItem(),
      ),
    );
  }
}
