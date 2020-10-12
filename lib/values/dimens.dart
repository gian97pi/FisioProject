// Flutter imports:
import 'package:flutter/cupertino.dart';

class AppDimens {
	AppDimens._();

	static double heightMultiplier;
	static double widthMultiplier;

	static double textMultiplier;
	static double imageMultiplier;

	static void initConfig(Orientation orientation, Size size) {
		var screenWidth = 0.0;
		var screenHeight = 0.0;

		if (orientation == Orientation.portrait) {
			screenWidth  = size.width;
			screenHeight = size.height;
		} else {
			screenWidth  = size.height;
			screenHeight = size.width;
		}

		var blockSizeHorizontal = screenWidth / 100;
		var blockSizeVertical = screenHeight / 100;

		heightMultiplier = blockSizeVertical;
		widthMultiplier = blockSizeHorizontal;

		textMultiplier = blockSizeVertical;
		imageMultiplier = blockSizeHorizontal;
	}

}
