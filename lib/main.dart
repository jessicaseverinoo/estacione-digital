import 'package:estacione_digital/design_system/light_theme.dart';
import 'package:estacione_digital/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estacione Digital',
      theme: lightTheme,
      home: const App(),
    );
  }
}
