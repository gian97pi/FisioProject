import 'package:device_preview/device_preview.dart';
import 'package:fisioproject/ui/views/giorno_aggiunta.dart';
import 'package:fisioproject/ui/views/intro_name_step.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/ui/views/bottom_menu.dart';
import 'package:fisioproject/values/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'classes/user.dart';

void main() => runApp(
    DevicePreview(
      //!kReleaseMode
      enabled: false,
      builder: (context) => MyApp(),
    )
);

class MyApp extends StatelessWidget {
  static SharedPreferences sharedPreferences;
  Future<SharedPreferences> _getData() async {
    return await SharedPreferences.getInstance();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _getData().then((u) {
      sharedPreferences = u;
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Fisio',
      theme: AppThemes.fisio,
      home: ProfileName(),
    );
  }
}
