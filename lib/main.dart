import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground/ui/hbo_max.dart';

void main() {
  // Lock to portrait orientation.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(_buildMaterialApp(HboMaxMainPage()));
}

Widget _buildMaterialApp(Widget home) => MaterialApp(
    title: "Playground",
    key: GlobalKey(debugLabel: "app"),
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: "navigator"),
    home: home,
  );