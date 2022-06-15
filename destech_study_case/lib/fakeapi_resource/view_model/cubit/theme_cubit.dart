import 'package:bloc/bloc.dart';
import 'package:destech_study_case/product/theme/dark_theme.dart';
import 'package:destech_study_case/product/theme/light_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  void toggleTheme(){
    emit(state.copyWith(isLightTheme: !(state.isLightTheme ?? false)));
  }
}