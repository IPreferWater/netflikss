import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:netflikss/model/Serie.dart';
import 'package:netflikss/screen/serie_screen.dart';
import 'package:netflikss/widget/card_serie.dart';

class HomePage extends StatefulWidget{

  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {

  List<Serie> series;

  @override
  void initState(){
    super.initState();
    series = [];
    _testGraphQl();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Items'),
          actions: <Widget>[
          ],
        ),
        body: _creationMenu(),
      );
  }

  Widget _creationMenu() {
    return GridView.count(
      crossAxisCount: 2,
       children: series.map((serie) {

          return Center(
            child: CardSerie(serie: serie, onTap: showDialogEditItem),
          );
       }).toList(),
    );

  }

  Future _testGraphQl() async {
    GraphQLClient client = GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(
        uri: 'http://localhost:7171/query',
      ),
    );
    QueryResult result = await client.query(
      QueryOptions(
          documentNode: gql(""" 
               {
                	series{
                  label,
                  directoryName
                  seasons{
                    number,
                    label,
                    directoryName
                    episodes{
                      label,
                    number,
                     fileName 
                    }
                  }
                }
              }
                      """
          )),

    );
    if (result.hasException) {
      print(result.exception);
    }else{
      var seriesJson = result.data["series"];
      var seriesFromGraph = seriesJson.map((title) => Serie.fromJson(title)).toList().cast<Serie>();
      print(seriesFromGraph);
      setState(() { series = seriesFromGraph; });
    }
  }

  showDialogEditItem(Serie serie){
    print("naviguate");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SerieScreen(serie: serie))
    );
  }
}