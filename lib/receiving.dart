import 'package:flutter/material.dart';

class Receiving extends StatelessWidget {
  final String title = 'Receiving';

  // Receiving(this.title);

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