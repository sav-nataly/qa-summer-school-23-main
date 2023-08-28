import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

abstract class ProfileTestScreen {
  /// Текстовое поле ввода фамилии
  static Finder surnameField = GeneralTestScreen.textField('Surname');

  /// Текстовое поле ввода имени
  static Finder firstNameField = GeneralTestScreen.textField('Name');

  /// Текстовое поле ввода отчества
  static Finder secondNameField = GeneralTestScreen.textField('SecondName');

  /// Текстовое поле ввода даты рождения
  static Finder birthdayField = GeneralTestScreen.textField('Birthday');
}
