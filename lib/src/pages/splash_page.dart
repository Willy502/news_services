import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

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

    final String routeName = 'login';

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }
}