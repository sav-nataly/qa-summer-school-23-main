import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

/// Экран с заметкой о себе
abstract class AboutMeTestScreen {
  /// Текстовое поле "обо мне"
  static Finder aboutMeField =
      GeneralTestScreen.textField('Write a few words about yourself');

  /// Кнопка сохранения данных профиля
  static Finder saveBtn = find.widgetWithText(ElevatedButton, 'Save');
}
