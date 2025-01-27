import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(69, 154, 255, 1),
  primaryColorLight: const Color.fromRGBO(191, 220, 251, 1),
  cardColor: const Color.fromRGBO(164, 179, 196, 1),
  hintColor: const Color.fromRGBO(232, 243, 249, 1),
  highlightColor: const Color.fromRGBO(58, 148, 231, 0.1),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromRGBO(191, 220, 251, 1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(164, 179, 196, 1),
        fontSize: 17),
    prefixIconColor: const Color.fromRGBO(164, 179, 196, 1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromRGBO(164, 179, 196, 1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromRGBO(191, 220, 251, 1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.blue.shade300,
        width: 1.5,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Color.fromRGBO(191, 220, 251, 1),
      backgroundColor: Colors.white,
      selectedItemColor: Color.fromRGBO(69, 154, 255, 1),
      elevation: 10,
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedIconTheme:
          IconThemeData(size: 25, color: Color.fromRGBO(191, 220, 251, 1))),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.black,
        height: 2,
        fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black),
    labelMedium: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
  ),
);
