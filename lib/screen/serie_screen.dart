import 'package:flutter/material.dart';
import 'package:netflikss/model/Season.dart';
import 'package:netflikss/model/Serie.dart';
import 'package:netflikss/screen/video_screen.dart';
import 'package:netflikss/widget/episode_card.dart';
import 'package:netflikss/widget/main_scaffold.dart';

class SerieScreen extends StatefulWidget {
  final Serie serie;

  SerieScreen({@required this.serie});

  _SerieScreenState createState() => _SerieScreenState();
}

class _SerieScreenState extends State<SerieScreen> {
  Season seasonSelected;

  @override
  void initState() {
    super.initState();
    seasonSelected = widget.serie.seasons.first;
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: _creationMenu(),
    );
  }

  Widget _creationMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text("fffff")),
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          children: seasonSelected.episodes.map((episode) {
            return Center(
                child: EpisodeCard(
                    episode: episode, onTap: navigateToVideoPlayer));
          }).toList(),
        ))
      ],
    );
  }

  navigateToVideoPlayer(String url) {
    String path =
        "${widget.serie.info.stockPath}/${widget.serie.info.directory}/${seasonSelected.directoryName}/$url";
    print(path);

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: path)));
  }
}
