// Flutter imports:
import 'package:fisioproject/ui/views/bottom_menu.dart';
import 'package:fisioproject/ui/views/intro_name_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:fisioproject/classes/router.dart' as router;
import 'package:fisioproject/values/themes.dart';

import 'classes/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
      //!kReleaseMode
      enabled: false,
      builder: (context) => MaterialApp(
        home: Fisio()
      )
  ));
}

class Fisio extends StatelessWidget {
  static SharedPreferences sharedPreferences;

  Future<SharedPreferences> _loadPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  // This widget is Flutter's root.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.RouteHandler.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => router.UndefinedView(
            name: settings.name,
          )),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Fisio',
      theme: AppThemes.fisio,
      home: FutureBuilder(
        future: Future.wait([_loadPreferences()]),
        builder: (ctx, prefSnapshot) {
          if (prefSnapshot.connectionState == ConnectionState.done) {
            SharedPreferences storedPrefs = prefSnapshot.data[0] as SharedPreferences;

            if (User.exists(storedPrefs)) {
              return BottomMenu();
            } else {
              return IntroNameStep();
            }
          } else {
            // TODO: return SplashScreen();
            return Center(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: CircularProgressIndicator()
              ),
            );
          }
        })
    );
  }
}
