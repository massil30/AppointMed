import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFBFBFE),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Color(0xFFE3F2FD),
    ),
    textTheme: GoogleFonts.leagueSpartanTextTheme(), // Apply font
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D1B2A),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 6, 37, 114),
      secondary: Color.fromARGB(255, 44, 131, 4),
    ),
    textTheme: GoogleFonts.leagueSpartanTextTheme(ThemeData.dark().textTheme),
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.light ? _darkTheme : _lightTheme);
  }
}
