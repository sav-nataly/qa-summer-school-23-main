import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class MainTestScreen {
  /// edit button
  static Finder editProfileBtn =
      find.widgetWithText(ElevatedButton, 'Edit profile');
}
