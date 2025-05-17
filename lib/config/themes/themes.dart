import 'package:flutter/material.dart';
import '../colors.dart'; // Ensure colors.dart contains your theme colors

var lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: dContainerColor
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: dBackgroundColor,
    filled: true,
  ),
  colorScheme: ColorScheme.light(
    primary: PrimaryColor,
    background: dBackgroundColor,
    onBackground: donContainerColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: donContainerColor,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
);

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: PrimaryColor,
    onPrimary: donBackgroundColor,
    background: dBackgroundColor,
    onBackground: donBackgroundColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: donContainerColor,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      fontFamily: 'Poppins',
      color: PrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      color: donBackgroundColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      color: donBackgroundColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      color: donContainerColor,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: donBackgroundColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: donBackgroundColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: donContainerColor,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: donContainerColor,
      fontWeight: FontWeight.w300,
      fontFamily: 'Poppins',
    ),
  ),
);
