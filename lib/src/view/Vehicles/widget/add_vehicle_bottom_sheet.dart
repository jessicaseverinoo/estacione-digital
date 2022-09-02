import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddVehicleBottomSheet extends StatefulWidget {
  const AddVehicleBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddVehicleBottomSheet> createState() => _AddVehicleBottomSheetState();
}

class _AddVehicleBottomSheetState extends State<AddVehicleBottomSheet> {
  bool _isSelectedFavorite = false;
  bool _isSelectedTypeVehicle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 16,
        top: 48,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Placa do veículo',
              style: TextStyle(color: kCoolGrey, fontSize: 15),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Modelo',
              style: TextStyle(color: kCoolGrey, fontSize: 15),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Favorito',
                  style: TextStyle(color: kCoolGrey, fontSize: 15),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: _isSelectedFavorite,
                  onChanged: (bool value) {
                    setState(() {
                      _isSelectedFavorite = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Tipo de veículo',
              style: TextStyle(color: kCoolGrey, fontSize: 15),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle light when tapped.
                      _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(_isSelectedTypeVehicle
                            ? 'assets/icons/car_on.png'
                            : 'assets/icons/car_off.png'),
                        height: 64,
                        width: 64,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle light when tapped.
                      _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(_isSelectedTypeVehicle
                            ? 'assets/icons/truck_on.png'
                            : 'assets/icons/truck_off.png'),
                        height: 64,
                        width: 64,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle light when tapped.
                      _isSelectedTypeVehicle = !_isSelectedTypeVehicle;
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(_isSelectedTypeVehicle
                            ? 'assets/icons/buss_on.png'
                            : 'assets/icons/buss_off.png'),
                        height: 64,
                        width: 64,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }
}
