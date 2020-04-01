import 'package:flutter/material.dart';

class Default extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return defaultSchede();
  }
}

class defaultSchede extends State {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Ciao"),
          Text("Bau Bau"),
        ],
      ),
    );
  }
}