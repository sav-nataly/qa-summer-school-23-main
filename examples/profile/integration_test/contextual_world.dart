import 'package:flutter_gherkin/flutter_gherkin.dart';

class ContextualWorld extends FlutterWidgetTesterWorld {
  Map<String, dynamic> scenarioContext = <String, dynamic>{};

  @override
  void dispose() {
    super.dispose();
    scenarioContext.clear();
  }

  T getContext<T>(String key) {
    return scenarioContext[key] as T;
  }

  void setContext(String key, dynamic value) {
    scenarioContext[key] = value;
  }
}