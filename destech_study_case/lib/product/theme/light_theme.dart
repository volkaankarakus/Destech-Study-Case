import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColor = LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(

            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
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
            onPrimary: LightColor().blueMenia,
          ),
        ),


        textTheme:
        ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
                fontSize: 20,
                color: _lightColor.amour),
          subtitle2: TextStyle(
              fontSize: 18,
              color: _lightColor.amour),
          headline6: TextStyle(
              fontSize: 24,
              color: _lightColor.amour),
          headline5: TextStyle(
              fontSize: 28,
              color: _lightColor.amour),
          caption: TextStyle(
              fontSize: 14,
              color: _lightColor.amour),
        ),
    );
  }
}

class LightColor {
  final Color jacaranda = const Color(0xFF1C021C);
  final Color amour = const Color(0xFFFEFBFE);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
  final Color spandexGreen = const Color(0xFF32c43f);
  final Color russianViolet = const Color(0xFF38164b);
  final Color vanishing = const Color(0xFF36094e);
}