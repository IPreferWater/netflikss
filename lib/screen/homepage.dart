import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class HomePage extends StatefulWidget{

  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
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
    return Text("ddddd");
  }

  Future _testGraphQl() async {
    GraphQLClient client = GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(
        uri: 'localhost:8080',
      ),
    );

    print("client should be ok");

    QueryResult result = await client.query(
      QueryOptions(
          documentNode: gql("""
           {
           series{
             label,
             seasons{
               number,
               episodes{
                 number
               }
             }
            }
           }"""
          )),
    );
    if (result.hasException) {
      print(result.exception.toString());
    }else{
      print(result.data);
    }

  }
}