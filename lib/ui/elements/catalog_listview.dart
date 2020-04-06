import 'package:fisioproject/ui/views/giorno_aggiunta.dart';
import 'package:flutter/material.dart';
//import 'router.dart' as router;

// ignore: must_be_immutable
class CatalogListView extends StatefulWidget {
  @override
  ListState createState() => ListState();

  final List<String> entries;

  const CatalogListView({Key key, @required this.entries})
      : super(
            key:
                key); //costruttore del widget personalizzato, uso una sola listview per tutte le pagine
}

class ListState extends State<CatalogListView> {
  bool itemActive;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 100),
            height: 230,
            color: Colors.greenAccent,
            child: ListView.separated(
              //crea una listview con gli elementi distanziati
              padding: const EdgeInsets.all(8),
              itemCount: widget.entries.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  //TODO mettere l'icona gestita da itemActive
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        '${widget.entries[index]}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 41, 171, 166),
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    print(widget.entries[index]);
                    //Navigator.pushNamed(context, widget.route , arguments: widget.entries[index]);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => GiornoAggunta(
                                argument: widget.entries[index])));
                    //passa come argomento la selezione
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
