import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class MainTestScreen {
  /// Кнопка редактирования профиля
  static Finder editProfileBtn =
      find.widgetWithText(ElevatedButton, 'Edit profile');
}
