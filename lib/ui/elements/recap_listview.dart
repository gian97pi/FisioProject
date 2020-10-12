import 'package:fisioproject/classes/schedule.dart';
import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';

class RecapListView extends StatefulWidget {
  @override
  _RecapListViewState createState() => _RecapListViewState();

  final Schedule schedule;

  const RecapListView({Key key, @required this.schedule})
      : super(key: key);
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
          itemCount: widget.schedule.sessions.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Text('${widget.schedule.sessions[index].day}'),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctx, int secondIndex) {
                        return Container(
                            height: 44,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 220),
                                    blurRadius: 5.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.0,
                                        3.0), // shadow direction: bottom right
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 0, 0),
                                    child: Text(
                                        '${widget.schedule.sessions[index].exercises[secondIndex]}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: widget.schedule.sessions[index].exercises.length),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ))
      ],
    );
  }
}
