// ignore_for_file: constant_identifier_names

part of 'text_theme_cubit.dart';

enum TextThemes {
  Light,
  Dark,
}

enum ThemeMode {
  Light,
  Dark,
}

class TextThemeState extends Equatable {
  final TextThemes textTheme;
  final ThemeMode themeMode;
  const TextThemeState({required this.textTheme, required this.themeMode});

  @override
  List<Object> get props => [textTheme];
  List<Object> get props1 => [themeMode];


  factory TextThemeState.initial() => const TextThemeState(
      textTheme: TextThemes.Light, themeMode: ThemeMode.Light);
  TextThemeState copyWith({TextThemes? textTheme, ThemeMode? themeMode}) {
    return TextThemeState(
      textTheme: textTheme ?? this.textTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  String toString() => 'TextThemeState(textTheme: $textTheme)';
}
