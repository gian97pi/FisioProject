import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/ui/views/day_selection.dart';
import 'package:fisioproject/values/colors.dart';
import 'package:flutter/material.dart';
//import 'router.dart' as router;

// ignore: must_be_immutable
class DaySelectionListview extends StatefulWidget {
  @override
  ListState createState() => ListState();

  final List<String> entries;

  const DaySelectionListview({Key key, @required this.entries})
      : super(
            key:
                key); //costruttore del widget personalizzato, uso una sola listview per tutte le pagine
}

class ListState extends State<DaySelectionListview> {
  bool itemActive;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            child: ListView.separated(
              //crea una listview con gli elementi distanziati

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.entries.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 220),
                              blurRadius: 5.0,
                              spreadRadius: 0.5,
                              offset: Offset(
                                  0.0, 3.0), // shadow direction: bottom right
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.entries[index],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Icon(
                              Custom.next,
                              size: 17,
                              color: AppColors.primaryText,
                            ),
                          ],
                        ),
                      )),
                  onTap: () {
                    print(widget.entries[index]);
                    //Navigator.pushNamed(context, widget.route , arguments: widget.entries[index]);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => DaySelection(
                                argument: widget.entries[index])));
                    //passa come argomento la selezione
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 6),
            ),
          ),
        ],
    );
  }
}
