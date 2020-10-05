

import 'package:fisioproject/ui/elements/selezione_giorno_listview.dart';
import 'package:flutter/material.dart';

class DaySelection extends StatefulWidget{
  final String argument;

  const DaySelection({Key key, @required this.argument}) : super(key: key);

  @override
  _DaySelectionState createState() => _DaySelectionState();
}

class _DaySelectionState extends State<DaySelection> {
  @override
  Widget build(BuildContext context) {
    List<String> utensil = [
      'A casa',
      'In palestra',
    ];

    return Scaffold(
        body:Container(
          //child: Text(widget.argument.toString())
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: DaySelectionListview(entries: utensil),
          )
        )
    );
  }
}