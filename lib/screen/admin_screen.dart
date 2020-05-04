import 'package:flutter/material.dart';
import 'package:netflikss/widget/stock_path_picker.dart';

class AdminScreen extends StatefulWidget {
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  //Configuration configuration;
  // String stockPath;

  @override
  void initState() {
    super.initState();
    //fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('admin'),
        actions: <Widget>[],
      ),
      body: _creationMenu(),
    );
  }

  Widget _creationMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Expanded(child: StockPathPicker())],
    );
  }

  /*fetchAlbum() async {
    final response = await http.get('http://localhost:7171/stockpath');
    if (response.statusCode == 200) {
      /*var jsonMap = json.decode(response.body);*/
      setState(() { stockPath = response.body; });

      print(response.body);
    }
  }*/
}
