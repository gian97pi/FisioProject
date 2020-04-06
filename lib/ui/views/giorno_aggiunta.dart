

import 'package:fisioproject/ui/elements/catalog_listview.dart';
import 'package:flutter/material.dart';

class GiornoAggunta extends StatefulWidget{
  final String argument;

  const GiornoAggunta({Key key, @required this.argument}) : super(key: key);

  @override
  _GiornoAgguntaState createState() => _GiornoAgguntaState();
}

class _GiornoAgguntaState extends State<GiornoAggunta> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String> utensil = [
      'Appliance',
      'Body','ciao','ciao','ciqo','ciao','ciao','ciao','ciao','c','c','c','c','c'
    ];

    return Scaffold(
        body:Container(
          child: Text(widget.argument.toString())

        )
    );
  }
}