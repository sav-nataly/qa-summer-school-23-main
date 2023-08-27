import 'package:flutter_test/flutter_test.dart';
import 'general_test_screen.dart';

abstract class CityTestScreen {
  static Finder cityField = GeneralTestScreen.textField('Place of residence');
}
