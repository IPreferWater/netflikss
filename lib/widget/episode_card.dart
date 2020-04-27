import 'package:flutter/material.dart';
import 'package:netflikss/model/Episode.dart';
import 'package:netflikss/model/Serie.dart';

class EpisodeCard extends StatefulWidget {
  final Episode episode;
  final void Function(String url) onTap;

  EpisodeCard({@required this.episode, @required this.onTap});

  _EpisodeCardState createState() => _EpisodeCardState();
}

class _EpisodeCardState extends State<EpisodeCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Episode episode = widget.episode;
    return Center(
      child: InkWell(
        onTap: () {
          print("read episode $episode");
          widget.onTap(episode.fileName);
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(episode.label),
                subtitle: Text('quick description?'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('todo see more'),
                    onPressed: () {
                      print("todo want to see more");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
