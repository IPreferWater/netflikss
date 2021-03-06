import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:netflikss/model/Movie.dart';
import 'package:netflikss/model/Serie.dart';
import 'package:netflikss/model/wrap_netflikss.dart';
import 'package:netflikss/screen/serie_screen.dart';
import 'package:netflikss/screen/video_screen.dart';
import 'package:netflikss/widget/card_netflikss.dart';
import 'package:netflikss/widget/main_scaffold.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List wrapNetflikss;

  @override
  void initState() {
    super.initState();
    wrapNetflikss = [];
    _testGraphQl();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: _homePageBody(),
    );
  }

  Widget _homePageBody() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 8,
        childAspectRatio: 5 / 2,
        children: wrapNetflikss.map((wrap) {
          return CardNetflikss(
              wrapNetflikss: wrap, onTap: navigateToSerieScreen);
        }).toList(),
      ),
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
      QueryOptions(documentNode: gql(""" 
               {
                 netflikss{
    configuration{fileServerPath,stockPath,
      serverConfiguration{port,allowedOrigin}
    },
    movies{
      info{directory,label,stockPath,img,type},
      fileName
    },
      	series{
      info{directory,label,stockPath,img,type},
      seasons{number,label, directoryName,
        episodes{label,number,fileName}
      }
    }
  }
              }
                      """)),
    );
    if (result.hasException) {
      print(result.exception);
    } else {
      var netflikss = result.data["netflikss"];

      var seriesJson = netflikss["series"];
      var moviesJson = netflikss["movies"];

      var seriesFromJson = seriesJson
          .map((serie) => Serie.fromJson(serie))
          .toList()
          .cast<Serie>();

      var moviesFromJson = moviesJson
          .map((movie) => Movie.fromJson(movie))
          .toList()
          .cast<Movie>();
      setState(() {
        wrapNetflikss.addAll(seriesFromJson);
        wrapNetflikss.addAll(moviesFromJson);
      });
    }
  }

  navigateToSerieScreen(WrapNetflikss wrapNetflikss) {
    if (wrapNetflikss is Serie) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SerieScreen(serie: wrapNetflikss)));
    }

    if (wrapNetflikss is Movie) {
      String url = wrapNetflikss.buildUrl(wrapNetflikss.fileName);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: url)));
    }
  }
}
