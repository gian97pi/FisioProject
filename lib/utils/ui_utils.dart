import 'package:fisioproject/enums/device_screen_type.dart';
import 'package:flutter/material.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  //Fixed Device Width
  double deviceWidth = 0;

  //Define deviceWidth based on orientation
  if(orientation == Orientation.landscape)
    deviceWidth = mediaQuery.size.height;
  else
    deviceWidth = mediaQuery.size.width;


  if(deviceWidth > 950)
    return DeviceScreenType.Desktop;

  if(deviceWidth > 600)
    return DeviceScreenType.Tablet;

  return DeviceScreenType.Mobile;
}