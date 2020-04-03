import 'package:fisioproject/values/dimens.dart';
import 'package:flutter/material.dart';

class ResponsiveOrientationLayout extends StatelessWidget {

	final WidgetBuilder landscape;
	final WidgetBuilder portrait;

	const ResponsiveOrientationLayout({
		Key key, this.landscape, this.portrait,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Builder(
			builder: (context) {
				var mediaQuery = MediaQuery.of(context);

				var orientation = mediaQuery.orientation;
				var size = mediaQuery.size;

				AppDimens.initConfig(orientation, size);

				if(orientation == Orientation.landscape) {
					if (landscape != null) {
						return landscape(context);
					}
				}
				return portrait(context);
			},
		);
	}

}
