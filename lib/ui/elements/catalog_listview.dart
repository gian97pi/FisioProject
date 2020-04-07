import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CatalogListViewCard extends StatefulWidget {
  @override
  ListState createState() => ListState();

  final List<String> entries;
  final String route;

  const CatalogListViewCard({Key key, @required this.entries, this.route}) : super(key: key); //costruttore del widget personalizzato, uso una sola listview per tutte le pagine
}

class ListState extends State<CatalogListViewCard>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          Container(
            child: ListView.separated(   //crea una listview con gli elementi distanziati
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: widget.entries.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child:Container(
                    height: 50,
                    child: Center(child: Text('${widget.entries[index]}'
                    ),
                    ),
                  ),onTap: (){
                  print(widget.entries[index]);
                  Navigator.pushNamed(context, widget.route , arguments: widget.entries[index]);
                  /*Navigator.push(context,new MaterialPageRoute(
                      builder: (context) => ExUtensilSelection(from: widget.entries[index])))
                  //passa come argomento la selezione
                   */
                },
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
    );
  }
}