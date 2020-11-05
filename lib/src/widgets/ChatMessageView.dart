import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage({this.text, this.name});
  final String text;
  final String name;


  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 2,
      child: new Container(
        margin: EdgeInsets.all(8),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}