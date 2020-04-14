import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StockPathPicker extends StatefulWidget{

  _StockPathPickerState createState() => _StockPathPickerState();

}
class _StockPathPickerState extends State<StockPathPicker> {

  String stockPath;
  List<String> directories;

  @override
  void initState(){
    super.initState();
    getStockPath();
  }

  @override
  Widget build(BuildContext context) {

    if(stockPath==null){
      return Text("error api");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(stockPath.isNotEmpty
                ? stockPath : "racine" )
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: FlatButton(
              onPressed: () {
                if (stockPath.isEmpty) {
                  return;
                }
                int lastIndexSlash = stockPath.lastIndexOf('/');
                stockPath = stockPath.substring(0, lastIndexSlash);
                getDirectoriesList();
              },
              child: Text(
                "go back",
              ),
            )
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: directories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('${directories[index]}')),
                        ),
                        onTap: (){
                          stockPath = '$stockPath/${directories[index]}';
                          getDirectoriesList();
                        },
                      );
                    }
                )

        )
      ],
    );
  }

  getStockPath() async {
    final response = await http.get('http://localhost:7171/stockpath');
    if (response.statusCode == 200) {
      stockPath = response.body;
      getDirectoriesList();
    }
  }

  getDirectoriesList() async {
    final response = await http.post(
        'http://localhost:7171/directorieslist',
        body: stockPath);

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body );
      var directoriesMapped = jsonMap.map((j) => j).toList().cast<String>();

      setState(() { directories = directoriesMapped; });
    }
  }
}