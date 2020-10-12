// Flutter imports:
import 'package:fisioproject/ui/views/intro_name_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:fisioproject/classes/router.dart' as router;
import 'package:fisioproject/values/themes.dart';

// import 'package:fisioproject/ui/views/giorno_aggiunta.dart';

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

  Future<SharedPreferences> _getData() async {
    return await SharedPreferences.getInstance();
  }

  // This widget is Flutter's root.
  @override
  Widget build(BuildContext context) {
    _getData().then((storedPrefs) {
      sharedPreferences = storedPrefs;
    });

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
      home: IntroNameStep(),
      // home: GiornoAggunta(),
    );
  }
}
