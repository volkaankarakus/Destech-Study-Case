import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  void changeTheme() {
    emit(state.copyWith(isLightTheme: !(state.isLightTheme ?? false)));
  }

  ThemeData? curTheme() {
      emit(state.copyWith(
          currentTheme: !state.isLightTheme ? ThemeData.light() : ThemeData.dark()));

  }
}