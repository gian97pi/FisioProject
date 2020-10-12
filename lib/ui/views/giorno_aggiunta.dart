

import 'package:fisioproject/classes/ProvaEx.dart';
import 'package:fisioproject/ui/elements/recap_listview%5E2.dart';
import 'package:flutter/material.dart';

class GiornoAggunta extends StatefulWidget{
  const GiornoAggunta({Key key}) : super(key: key);

  @override
  _GiornoAgguntaState createState() => _GiornoAgguntaState();
}

class _GiornoAgguntaState extends State<GiornoAggunta> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<ProvaEx> prova = [new ProvaEx('Lunedì',['curl','crunch','slam']),
      new ProvaEx('Martedì', ['calf','dito','simone'])];

    return Scaffold(
        body:SafeArea(
          child: SingleChildScrollView(
            //child: Text(widget.argument.toString())
            child: RecapListView(schedule : prova),
          ),
        )
    );
  }
}