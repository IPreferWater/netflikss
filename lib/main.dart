import 'package:flutter/material.dart';
import 'package:netflikss/screen/homepage.dart';
import 'package:netflikss/widget/loginWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: HomePage(),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
    /* return Center(
      child: SizedBox(
        width: 400,
        child: Card(
          child: SignUpForm()
        ),
      ),
    );*/
  }
}
