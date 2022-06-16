part of 'theme_cubit.dart';

class ThemeState extends Equatable{
  bool? isLightTheme;
  ThemeState({this.isLightTheme});

  ThemeData get currentTheme => (isLightTheme ?? false) ? LightTheme().theme : DarkTheme().theme;


  @override
  List<Object?> get props => [isLightTheme];

  ThemeState copyWith({
  bool? isLightTheme,
}){
    return ThemeState(
      isLightTheme: isLightTheme ?? this.isLightTheme,
    );
  }


}