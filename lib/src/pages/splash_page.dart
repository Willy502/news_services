import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/src/shared/preferences.dart';

class SplashPage extends StatelessWidget {

  final preferences = Preferences();

  @override
  Widget build(BuildContext context) {

    changeScreen(context);

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Image(
            image: AssetImage('assets/img/squirtle.png')
          ),
        ),
      )
    );
  }

  void changeScreen(BuildContext context) {
    print(preferences.token);
    final String routeName = preferences.token != '' ? 'news' : 'login';

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }
}