import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoZone extends StatefulWidget {

  final VideoPlayerController videoPlayerController;

  VideoZone({@required this.videoPlayerController});

  @override
  _VideoZoneState createState() => _VideoZoneState();
}

class _VideoZoneState extends State<VideoZone> {

  @override
  void initState() {

    super.initState();
  }

  void _mouseMoving(PointerEvent details) {
    print('the mouse is mooving');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: _mouseMoving,
        child: Stack(
            children: <Widget>[
              VideoPlayer(widget.videoPlayerController),
              Container(
                color: Colors.redAccent,
                  height: 100,
                width: 100,
              )
            ]
        )
    );
  }
}