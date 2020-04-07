import 'package:fisioproject/classes/schedule.dart';
import 'package:flutter/material.dart';

class RecapListView extends StatefulWidget {
  @override
  _RecapListViewState createState() => _RecapListViewState();

  final List<Schedule> schedule;

  RecapListView(this.schedule);
}

class _RecapListViewState extends State<RecapListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: widget.schedule.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 15,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Text('${widget.schedule[index].day}'),
                    ListView.separated(itemBuilder: (BuildContext ctx, int secondIndex){
                      return Card(
                        child: Text('${widget.schedule[index].exercise[secondIndex].name}'),
                      );
                    },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                        itemCount: widget.schedule[index].exercise.length)
                  ],
                ),
              ),
            );
          },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        )
        )
      ],
    );
  }
}
