import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          ),
            color: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(color: Colors.white),
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))
            ),

         scaffoldBackgroundColor: Colors.grey[300],

        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

        colorScheme: const ColorScheme.light(),

        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            onPrimary: _LightColor().blueMenia,
          ),
        ),

        textTheme:
        ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
                fontSize: 20,
                color: _lightColor._textColor),
          headline5: TextStyle(
              fontSize: 28,
              color: _lightColor._textColor),
        ),
    );
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 37, 5, 5);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}