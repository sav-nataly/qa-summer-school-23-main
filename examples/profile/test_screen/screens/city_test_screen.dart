import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

/// Экран выбора города
abstract class CityTestScreen {
  /// Текстовое поле ввода города
  static Finder cityField = GeneralTestScreen.textField('Place of residence');
}
