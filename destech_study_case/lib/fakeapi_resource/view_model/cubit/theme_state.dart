part of 'theme_cubit.dart';

class ThemeState extends Equatable{

  final ThemeData? currentTheme;
  final bool? isLightTheme;

  ThemeState({this.currentTheme,this.isLightTheme = false});

  @override
  List<Object?> get props => [currentTheme,isLightTheme];

  ThemeState copyWith({
  ThemeData? currentTheme,
  bool? isLightTheme
}){
    return ThemeState(
      currentTheme : currentTheme ?? this.currentTheme,
      isLightTheme : isLightTheme ?? this.isLightTheme
    );
  }
}