

import 'package:fisioproject/ui/elements/day_selection_listview.dart';
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
      'Appliance',
      'Body',
    ];

    return Scaffold(
        body:Container(
          //child: Text(widget.argument.toString())
          child:DaySelectionListview(entries: utensil)
        )
    );
  }
}