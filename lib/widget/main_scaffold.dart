import 'package:flutter/material.dart';
import 'package:netflikss/screen/admin_screen.dart';


class MainScaffold extends StatefulWidget{

  final Widget body;

  MainScaffold({
    @required this.body
  });

  _MainScaffoldState createState() => _MainScaffoldState();

}
class _MainScaffoldState extends State<MainScaffold> {

  Color blueGrey1 = Color(0xff708090);
  Color blueGrey2 = Color(0xff6D7F80);
  Color blueGrey3 = Color(0xff536878);
  Color blueGrey4 = Color(0xff536872);
  Color blueGrey5 = Color(0xff36454F);

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueGrey5,
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: blueGrey1,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminScreen()));
            },
          )
        ],
      ),
      body: widget.body,
    );
  }
}