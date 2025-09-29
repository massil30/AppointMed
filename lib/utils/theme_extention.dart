import 'package:flutter/material.dart';

extension ThemeColors on BuildContext {
  // Shortcut for ThemeData
  ThemeData get theme => Theme.of(this);

  // Common colors
  Color get primary => theme.colorScheme.primary;
  Color get secondary => theme.colorScheme.secondary;
}
