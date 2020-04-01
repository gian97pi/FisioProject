import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fisioproject/ui/base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150,
                  margin: EdgeInsets.all(0.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BaseWidget(
                        builder: (context, sizingInfo) => Text(sizingInfo.toString())),
                  )),
                Spacer(
                  flex: 1,
                ),
                Text(sizingInformation.toString()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home"),
                    backgroundColor: Colors.white),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text("Home"),
                      backgroundColor: Colors.green),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text("Home"),
                      backgroundColor: Colors.white),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      activeIcon: Container(color: Colors.red),
                      title: Text("Settings"),
                      backgroundColor: Colors.green)],
        ),
      );
    },);
  }
}
