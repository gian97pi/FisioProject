// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/values/colors.dart';

// ignore: must_be_immutable
class CatalogListView extends StatefulWidget {
  @override
  ListState createState() => ListState();

  final List<String> entries;
  final String route;

  const CatalogListView({Key key, @required this.entries, this.route}) : super(key: key); //costruttore del widget personalizzato, uso una sola listview per tutte le pagine
}

class ListState extends State<CatalogListView>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ListView.builder(
            //crea una listview con gli elementi distanziati
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: GestureDetector(
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
                  onTap: (){
                    print(widget.entries[index]);
                    Navigator.pushNamed(context, widget.route , arguments: widget.entries[index]);
                    /*Navigator.push(context,new MaterialPageRoute(
                      builder: (context) => ExUtensilSelection(from: widget.entries[index])))
                  //passa come argomento la selezione
                   */
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


