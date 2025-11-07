
import 'package:flutter/material.dart';
import 'package:makc_app/core/theme/custom_color_scheme.dart';


final class CustomLightTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
        appBarTheme: AppBarTheme(),
        colorScheme: CustomColorScheme.lightColorScheme,
      );
}
