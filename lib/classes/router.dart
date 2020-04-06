import 'package:flutter/material.dart';


class RouteHandler {

  static const String ExListRoute = "exercise";
  static const String ExUtensilRoute = "utensil";

  static Route<dynamic> generateRoute(RouteSettings settings) { //gestisce dove mandare il navigator
    switch (settings.name) {
      /*case ExUtensilRoute:
        return MaterialPageRoute(builder: (context) => ExUtensilSelection());
      case ExListRoute:
        return MaterialPageRoute(builder: (context) => ExerciseList());*/
      default:
        return MaterialPageRoute(builder: (context) => UndefinedView());
    }
  }
}

class UndefinedView extends StatelessWidget {  //route predefinita in caso di errore o non venga passata (placeholder)
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}