// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTest extends StatefulWidget {
  @override
  _DrawerTestState createState() => _DrawerTestState();
}

class _DrawerTestState extends State<DrawerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/container_bg.png')
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16,0,0,0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FisioMenu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
