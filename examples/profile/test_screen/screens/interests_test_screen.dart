import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Экран выбора интересов
abstract class InterestsTestScreen {
  /// Finder для поиска всех чекбоксов на экране
  static Finder chBox = find.byType(Checkbox);

  /// Finder для поиска всех текстов на экране
  static Finder textsList = find.byType(Text);
}
