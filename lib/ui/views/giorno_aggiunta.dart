// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fisioproject/classes/schedule.dart';
import 'package:fisioproject/classes/session.dart';
import 'package:fisioproject/ui/elements/recap_listview.dart';

class GiornoAggunta extends StatefulWidget{
  const GiornoAggunta({Key key}) : super(key: key);

  @override
  _GiornoAgguntaState createState() => _GiornoAgguntaState();
}

class _GiornoAgguntaState extends State<GiornoAggunta> {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement actual build function
    final List<Session> sessions = [ // Dummy test values
      new Session('Lunedì',
          ['Curl', 'Crunch', 'Slam']),
      new Session('Martedì',
          ['Calf', 'DiTo', 'Simone'])
    ];

    final Schedule schedule = new Schedule(sessions);

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: RecapListView(schedule: schedule),
          ),
        )
    );
  }
}
