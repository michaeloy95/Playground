import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Lock to portrait orientation.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(_buildMaterialApp(Container()));
}

Widget _buildMaterialApp(Widget home) => MaterialApp(
    title: "Playground",
    key: GlobalKey(debugLabel: "app"),
    home: home,
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: "navigator"));