import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  static const _key = 'selectedLanguage';

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key) ?? 'en';
    emit(Locale(code));
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
    emit(Locale(languageCode));
  }

  /// ✅ Toggle between English and French
  Future<void> toggleLanguage() async {
    final currentCode = state.languageCode;
    final newCode = currentCode == 'en' ? 'fr' : 'en';
    await changeLanguage(newCode);
  }

  /// ✅ Explicit helper functions for clarity
  // Future<void> setEnglish() async => await changeLanguage('en');
  //Future<void> setFrench() async => await changeLanguage('fr');
}
