// We're going to need these packages for accessing the Clipboard, themes, and files
import 'package:flutter/material.dart';
import 'package:pocket_museum_final/blocs/theme.dart';
import 'package:pocket_museum_final/pages/homepage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Setting up some things, like removing the glow - this can be modified in ScrollBehavior
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Pocket Museum',
      debugShowCheckedModeBanner: true,
      theme: theme.getTheme(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: Home(),
    );
  }
}

// removes the glow
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

