
import 'package:flutter/material.dart';
import 'package:makc_app/core/theme/custom_color_scheme.dart';


final class CustomDarkTheme {
  final ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(),
    fontFamily: 'PlusJakartaSans',
    colorScheme: CustomColorScheme.darkColorScheme,
  );
}
