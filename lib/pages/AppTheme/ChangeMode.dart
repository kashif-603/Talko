import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxBool isDarkTheme = false.obs;

  /// 👇 ThemeMode getter for current theme
  ThemeMode get themeMode => isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  void ChangeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}
