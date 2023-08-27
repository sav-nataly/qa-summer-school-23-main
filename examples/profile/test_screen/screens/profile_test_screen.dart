import 'package:flutter_test/flutter_test.dart';
import 'general_test_screen.dart';

abstract class ProfileTestScreen {
  static Finder surnameField = GeneralTestScreen.textField('Surname');
  static Finder firstNameField = GeneralTestScreen.textField('Name');
  static Finder secondNameField = GeneralTestScreen.textField('SecondName');
  static Finder birthdayField = GeneralTestScreen.textField('Birthday');
}
