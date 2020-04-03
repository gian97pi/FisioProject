import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:fisioproject/ui/views/bottom_menu.dart';
import 'package:fisioproject/values/themes.dart';

void main() => runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Fisio',
      theme: AppThemes.fisio,
      home: BottomMenu(),
    );
  }
}
