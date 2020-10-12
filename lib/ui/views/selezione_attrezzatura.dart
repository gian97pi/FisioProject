// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:fisioproject/classes/router.dart' as Router;
import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/ui/elements/catalog_listview.dart';
import 'package:fisioproject/ui/views/type_exercise.dart';
import 'package:fisioproject/values/colors.dart';

class SelezioneAttrezzatura extends StatefulWidget {
  @override
  _SelezioneAttrezzaturaState createState() => _SelezioneAttrezzaturaState();
}

class _SelezioneAttrezzaturaState extends State<SelezioneAttrezzatura> {
  @override
  Widget build(BuildContext context) {
    List<String> attrezzatura = [
      'CON ATTREZZATURA',
      'SENZA ATTREZZATURA',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Custom.back,
                              size: 17,
                              color: AppColors.primaryText,
                            ),
                          ),
                          Text(
                            "INDIETRO",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => TypeExerciseSelection()),
                        );
                      }),
                  Text(
                    "FATTO",
                    style: TextStyle(
                      color: Color.fromARGB(255, 41, 171, 166),
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/container_bg.png'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 15, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Esercizi",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Scegli una categoria \ndi esercizio",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 8, 0, 20),
                              child: Text(
                                "Test di esempio.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                      child: CatalogListView(entries: attrezzatura, route: Router.RouteHandler.ExerciseListRoute),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
