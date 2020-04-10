import 'package:flutter/material.dart';
import 'package:netflikss/model/Season.dart';
import 'package:netflikss/model/Serie.dart';
import 'package:netflikss/video_player.dart';
import 'package:netflikss/widget/episode_card.dart';

class SerieScreen extends StatefulWidget{

  Serie serie;

  SerieScreen({@required this.serie});

  _SerieScreenState createState() => _SerieScreenState();

}
class _SerieScreenState extends State<SerieScreen> {

  Season seasonSelected;

  @override
  void initState(){
    super.initState();
    seasonSelected = widget.serie.seasons.first;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('serie'),
          actions: <Widget>[
          ],
        ),
        body: _creationMenu(),
      );
  }

  Widget _creationMenu() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text("fffff")
        ),
            Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: seasonSelected.episodes.map((episode) {

                    return Center(
                      child: EpisodeCard(episode: episode, onTap: navigateToVideoPlayer)
                    );
                  }).toList(),
                )
            )
      ],
    );
  }

  navigateToVideoPlayer(String url){
    String path = "${widget.serie.directoryName}/${seasonSelected.directoryName}/$url";
    print(path);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: path)));
  }
}