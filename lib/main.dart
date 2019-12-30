import 'package:flutter/material.dart';

import 'ui/hat_shop.dart';
import 'ui/hbo_max.dart';

void main() => runApp(PlaygroundApp());

class PlaygroundApp extends StatefulWidget {
  @override
  _PlaygroundAppState createState() => _PlaygroundAppState();
}

class _PlaygroundAppState extends State<PlaygroundApp> {
  bool _isLightTheme;
  ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _isLightTheme = true;
    _themeMode = ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.deepOrangeAccent,
      backgroundColor: const Color(0xFFEEEEEE),
      cardColor: Colors.white,
      textSelectionColor: Colors.black,
    );

    final darkTheme = ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.deepPurpleAccent,
      backgroundColor: const Color(0xFF666666),
      cardColor: Colors.black,
      textSelectionColor: Colors.white,
    );

    final app = MaterialApp(
      key: GlobalKey(debugLabel: "app"),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      title: "Playground",
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: "navigator"),
      home: HomePage(
        isLightTheme: _isLightTheme,
        onToggle: (bool value) => setState(() {
          _isLightTheme = value;
          _themeMode = value ? ThemeMode.light : ThemeMode.dark;
        }),
      ),
    );
    
    return app;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({this.isLightTheme, this.onToggle});

  final bool isLightTheme;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    final themeToggle = Switch(
      activeColor: Colors.green,
      inactiveTrackColor: Colors.grey,
      value: isLightTheme,
      onChanged: (value) => onToggle(value),
    );

    final appBar = AppBar(
      title: Text("Playground App"),
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[themeToggle],
    );

    final scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildBody(context),
    );

    return scaffold;
  }

  Widget _buildBody(BuildContext context) {
    final pages = <Widget>[
      HboMaxMainPage(),
      HatShopMainPage(),
    ];

    final titles = <String>[
      "HBO Max",
      "Hat Shop",
    ];

    final tiles = List.generate(pages.length, (int index) {
      final dot = CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        radius: 5.0,
      );

      final text = Text(
        titles[index],
        style: Theme.of(context).textTheme.headline
          .copyWith(color: Theme.of(context).textSelectionColor),
      );

      final title = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dot,
          Container(width: 15.0),
          text,
        ],
      );

      final tile = ListTile(
        title: title,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => pages[index])),
      );

      final card = Card(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: tile,
      );

      return card;
    });

    final list = ListView(
      children: tiles,
    );

    return list;
  }
}