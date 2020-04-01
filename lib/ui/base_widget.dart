import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fisioproject/ui/sizing_information.dart';
import 'package:fisioproject/utils/ui_utils.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraint) {
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxConstraint.maxWidth, boxConstraint.maxHeight)
      );

      return builder(context, sizingInformation);
    });
  }
}
