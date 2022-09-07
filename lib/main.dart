import 'package:estacione_digital/design_system/light_theme.dart';
import 'package:estacione_digital/src/app.dart';
import 'package:estacione_digital/src/pages/Vehicles/vehicle_provider.dart';
<<<<<<< HEAD
=======
import 'package:estacione_digital/src/view/Vehicles/vehicle_provider.dart';
>>>>>>> 124dbd5 (change name title app to Estacione Digital)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VehicleProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Estacione Digital',
        theme: lightTheme,
        home: const App(),
      ),
    );
  }
}
