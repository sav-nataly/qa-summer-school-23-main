import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'general_test_screen.dart';

abstract class InterestsTestScreen {
  static Finder photoListItem = GeneralTestScreen.listItem('Photo');
  static Finder artListItem = GeneralTestScreen.listItem('Art');

  static Finder list = find.byType(ListView);

}
