part of 'theme_cubit.dart';

class ThemeState extends Equatable{

  final bool isLightTheme;

   ThemeState({this.isLightTheme = false});

  @override
  List<Object?> get props => [isLightTheme];

  ThemeData? get currentTheme => !isLightTheme ? LightTheme().theme : DarkTheme().theme;

  ThemeState copyWith({
  bool? isLightTheme
}){
    return ThemeState(
      isLightTheme : isLightTheme ?? this.isLightTheme
    );
  }
}