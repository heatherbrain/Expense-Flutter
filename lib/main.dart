import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

import 'package:flutter_second/widgets/expenses.dart';

var colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 255, 68, 108),
);

var darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const Color.fromARGB(255, 115, 31, 49),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //    DeviceOrientation.portraitUp,
  // ]).then( (fn) {

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: darkColorScheme.primaryContainer,
              foregroundColor: darkColorScheme.onPrimaryContainer,
          )
        ),
      ),
      // theme: ThemeData.dark().copyWith(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondaryContainer,
                  fontSize: 14),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
  // });
}
