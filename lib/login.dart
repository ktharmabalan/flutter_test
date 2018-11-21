import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final title = 'Login';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("Hi"),
            ),
          ],
        ),
      ),
    );
  }
}