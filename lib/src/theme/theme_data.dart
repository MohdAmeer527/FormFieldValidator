import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue, // Primary color
      scaffoldBackgroundColor: Colors.white, // Background color
      appBarTheme: const AppBarTheme(
        color: Colors.blue, // AppBar color
        iconTheme: IconThemeData(color: Colors.white), // AppBar icon color
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200], // Background color of TextFormField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent), // Focused border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey), // Enabled border color
        ),
        labelStyle: const TextStyle(color: Colors.blue), // Label color
        hintStyle: const TextStyle(color: Colors.grey), // Hint text style
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark, // Dark theme brightness
      primaryColor: Colors.blueGrey, // Primary color
    // Accent color
      scaffoldBackgroundColor: Colors.black, // Background color
      appBarTheme: const AppBarTheme(
        color: Colors.blueGrey, // AppBar color
        iconTheme: IconThemeData(color: Colors.white), // AppBar icon color
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
     
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[850], // Background color of TextFormField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.tealAccent), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.tealAccent), // Focused border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey), // Enabled border color
        ),
        labelStyle: const TextStyle(color: Colors.tealAccent), // Label color
        hintStyle: const TextStyle(color: Colors.white60), // Hint text style
      ),
    );
  }
}
