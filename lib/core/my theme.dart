import 'package:flutter/material.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();

  ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,  // Default light background
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(background: Colors.blue),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        color: Color(0xFFA67C00),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 53, 18, 211),
      ),
      labelLarge:TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      
       labelMedium: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 78, 75, 75),
      ),
    ),
  );

  ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color.fromARGB(255, 15, 14, 14),  // Set dark background
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(background: Colors.blue),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        color: Color(0xFFA67C00),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 102, 111, 214),
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 105, 104, 104),
      ),

      labelMedium: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 208, 206, 206),
      ),
    ),
  );
}
