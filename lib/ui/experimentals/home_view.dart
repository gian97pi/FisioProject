import 'package:fisioproject/models/responsive_orientation_layout.dart';
import 'package:fisioproject/ui/views/altro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
	  return ResponsiveOrientationLayout(
		  portrait: (BuildContext context) => ScreenTypeLayout.builder(
			  mobile: (BuildContext context) => Altro(),
			  tablet: (BuildContext context) => Altro(),
		  ),
		  landscape: (BuildContext context) => ScreenTypeLayout.builder(
			  mobile: (BuildContext context) => Container(color:Colors.blue),
			  tablet: (BuildContext context) => Container(color:Colors.black)
		  ),
	  );
  }

}
