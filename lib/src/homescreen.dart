import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final String buttonTxt;

  SecondRoute({Key key, @required this.buttonTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context, 'Yo!');
          },
          child: Text(this.buttonTxt),
        ),
      ),
    );
  }
}