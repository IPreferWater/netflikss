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
    return InkWell(
      onTap: () {
        widget.onTap(episode.fileName);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.green[900], Colors.white])),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    child: Container(
                      margin: EdgeInsets.only(left: 8, right: 2),
                      child: Text(widget.episode.label,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    child: Container(
                      margin: EdgeInsets.only(left: 8, right: 2),
                      child: Text(widget.episode.number.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
