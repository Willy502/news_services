import 'package:flutter/material.dart';
import 'package:news/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: 'splash'
    );
  }
}