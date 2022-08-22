import 'package:flutter/material.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: Color.fromARGB(115, 32, 32, 32),
    scaffoldBackgroundColor: Color.fromARGB(115, 53, 51, 51),
  );
}
