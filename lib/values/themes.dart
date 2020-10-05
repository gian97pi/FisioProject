import 'package:flutter/material.dart';
import 'values.dart';

class AppThemes {
	AppThemes._();

	static final ThemeData fisio = ThemeData(
			fontFamily: 'Rubik',
			brightness: Brightness.light,
			backgroundColor: AppColors.primaryBackground,
			scaffoldBackgroundColor: AppColors.primaryBackground,
			highlightColor: Colors.transparent,
			splashColor: Colors.transparent
	);

}