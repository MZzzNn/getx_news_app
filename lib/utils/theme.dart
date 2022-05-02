import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  Themes._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.grey,
    primaryColor:  Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      // centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black54),
      color: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.green,
      backgroundColor: Colors.white,
      elevation: 13,
      type: BottomNavigationBarType.shifting,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.green,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff393E46),
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      // centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.grey[200]),
      color: const Color(0xff232931),
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff232931),
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey[200],
      selectedItemColor: Colors.green,
      backgroundColor: const Color(0xff232931),
      elevation: 13,
      type: BottomNavigationBarType.shifting,
    ),
    primarySwatch: Colors.grey,
    primaryColor: const Color(0xff232931),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.green,
    ),
  );
}
