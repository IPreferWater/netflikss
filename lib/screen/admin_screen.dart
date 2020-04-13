import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflikss/model/Configuration.dart';
import 'package:http/http.dart' as http;

class AdminScreen extends StatefulWidget{



  _AdminScreenState createState() => _AdminScreenState();

}
class _AdminScreenState extends State<AdminScreen> {

  Configuration configuration;

  @override
  void initState(){
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('admin'),
          actions: <Widget>[
          ],
        ),
        body: _creationMenu(),
      );
  }

  Widget _creationMenu() {

    if(configuration==null){
      return Text("error api");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(configuration.stockPath.isNotEmpty
                ? configuration.stockPath : "not set yet" )
        )
      ],
    );
  }

   fetchAlbum() async {
    final response = await http.get('http://localhost:7171/stockpath');
    print("fetcgh");
    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      setState(() { configuration = Configuration.fromJson(jsonMap); });

      print(configuration);
    }
  }
}