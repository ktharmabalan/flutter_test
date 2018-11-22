import 'package:flutter/material.dart';
import 'package:hello_world/screens/home.dart';

final ThemeData iOSTheme = new ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.grey[400],
  primaryColorBrightness: Brightness.dark,
);

final ThemeData androidTheme = new ThemeData(
  primarySwatch: Colors.blue[800],
  primaryColor: Colors.green[100],
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Receiving'),
      // routes: <String, WidgetBuilder> {
      //   "/booking": (BuildContext context) => new Booking(),
      // },
    );
  }
}