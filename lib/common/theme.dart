import 'package:flutter/material.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';

final _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(32),
  borderSide: BorderSide.none,
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
  fontFamily: kFontFamily,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: _inputBorder,
    enabledBorder: _inputBorder,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    filled: true,
    fillColor: Palette.yellow.shade200,
    hintStyle: TextStyle(
      color: Palette.yellow.shade700,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
    indicatorColor: Colors.transparent,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
  ),
);
