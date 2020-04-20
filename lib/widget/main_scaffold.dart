import 'package:flutter/material.dart';
import 'package:netflikss/screen/admin_screen.dart';
import 'package:netflikss/colors.dart' as Colors;


class MainScaffold extends StatefulWidget{

  final Widget body;

  MainScaffold({
    @required this.body
  });

  _MainScaffoldState createState() => _MainScaffoldState();

}
class _MainScaffoldState extends State<MainScaffold> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.youtubeBlack,
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.blueGrey1,
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