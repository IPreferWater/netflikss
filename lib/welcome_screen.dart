import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget{

  _WelcomeScreenState createState() => _WelcomeScreenState();

}
class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.display3),
      ),
    );
  }

}