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
      body: _buildSerieScreen(),
    );
  }

  Widget _buildSerieScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Season>(
              value: seasonSelected,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white),
              onChanged: (Season seasonChanged) {
                setState(() {
                  seasonSelected = seasonChanged;
                });
              },
              items: widget.serie.seasons
                  .map<DropdownMenuItem<Season>>((Season value) {
                return DropdownMenuItem<Season>(
                    value: value,
                    child: Text(
                      value.label,
                    ));
              }).toList(),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: seasonSelected.episodes.map((episode) {
                return Container(
                  width: 160.0,
                  child: EpisodeCard(
                      episode: episode, onTap: navigateToVideoPlayer),
                );
              }).toList(),
            ))
      ],
    );
  }

  navigateToVideoPlayer(String fileName) {
    String path =
        widget.serie.buildUrl('${seasonSelected.directoryName}/$fileName');

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: path)));
  }
}
