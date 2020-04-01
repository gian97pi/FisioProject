import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fisioproject/classes/user.dart';

class Prova extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final User userBloc = Provider.of<User>(context);

    return Scaffold(
        body: Container(
          child: Center(
            child: TextField(
              controller: textEditingController,
              onChanged: (String str) {
                userBloc.name = str;
              },
            ),
          ),
        )
    );
  }
}
