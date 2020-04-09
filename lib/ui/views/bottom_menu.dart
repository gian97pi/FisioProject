import 'package:fisioproject/classes/double_buttons_model.dart';
import 'package:fisioproject/ui/views/info_esercizio.dart';
import 'package:fisioproject/ui/views/scheda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fisioproject/presentation/custom_icons.dart';
import 'package:fisioproject/ui/views/altro.dart';
import 'package:fisioproject/ui/views/riepilogo.dart';
import 'package:fisioproject/classes/user.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  int _currentIndex = 0;

  //Link alle varie sezioni
  final tabs = [
    Riepilogo(),
    ChangeNotifierProvider<ButtonsModel>.value(
    value: ButtonsModel(),
    child: Schede(),
    ),
    InfoEsercizio(),
    Altro(),

    /*ChangeNotifierProvider<User>.value(
      value: User(),
      child: Prova(),
    )*/
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: tabs[_currentIndex]
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bottom_menu_bg.png'),
                fit: BoxFit.fill
            )
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromRGBO(255, 255, 255, 99),
            iconSize: 25,
            selectedFontSize: 12,
            unselectedFontSize: 12,

            currentIndex: _currentIndex,

            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Custom.home),
                  ),
                  title: Text("Riepilogo")
              ),

              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Custom.clipboard),
                  ),
                  title: Text("Scheda")
              ),

              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Custom.exercise),
                  ),
                  title: Text("Esercizi")
              ),

              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Custom.other),
                  ),
                  title: Text("Altro")
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

