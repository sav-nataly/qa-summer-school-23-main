import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'general_test_screen.dart';

abstract class AboutMeTestScreen {
  static Finder aboutMeField =
      GeneralTestScreen.textField('Write a few words about yourself');
  static Finder saveBtn = find.widgetWithText(ElevatedButton, 'Save');
}
