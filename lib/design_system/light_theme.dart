import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: kPrimary,
  brightness: Brightness.light,
  backgroundColor: kWhite,
  dividerColor: kLight,
  errorColor: kDanger,
  scaffoldBackgroundColor: kWhite,
  appBarTheme: const AppBarTheme(
    color: kPrimary,
    elevation: 0,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: kPrimary,
    elevation: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    disabledColor: kLight,
    height: 52,
    buttonColor: kPrimary,
    textTheme: ButtonTextTheme.normal,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(kPrimary),
      elevation: MaterialStateProperty.all(0),
      animationDuration: const Duration(seconds: 1),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: kPrimary),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: kWhite,
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(kWhite),
      foregroundColor: MaterialStateProperty.all(kPrimary),
      elevation: MaterialStateProperty.all(0),
      animationDuration: const Duration(seconds: 1),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: kPrimary),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: kPrimary,
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: kWhite,
    iconColor: kWhite,
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      fontWeight: FontWeight.w800,
    ),
    headline3: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    headline5: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    headline6: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
  ),
);
