// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fisioproject/ui/views/selezione_attrezzatura.dart';
import 'package:fisioproject/ui/views/selezione_esercizio.dart';

class RouteHandler {

  static const String ExerciseListRoute = "exercise";
  static const String AttrEserciziRoute = "utensil";

  static Route<dynamic> generateRoute(RouteSettings settings) { //gestisce dove mandare il navigator
    switch (settings.name) {
      case AttrEserciziRoute:
        return MaterialPageRoute(builder: (context) => SelezioneAttrezzatura());
      case ExerciseListRoute:
        return MaterialPageRoute(builder: (context) => ExerciseList());
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
