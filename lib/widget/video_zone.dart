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
              Align(
                alignment:Alignment.bottomCenter,
                child: Container(
                  constraints: BoxConstraints.tightForFinite(
                    height: 50,
                  ),
                  color: Colors.transparent.withOpacity(0.5),
                    child :_buildMediaControl()
                ),
              )
            ],
                overflow: Overflow.visible,
        )
    );
  }

  Widget _buildMediaControl(){
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(widget.videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,),
          tooltip: 'play',
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (widget.videoPlayerController.value.isPlaying) {
                widget.videoPlayerController.pause();
              } else {
                // If the video is paused, play it.
                widget.videoPlayerController.play();
              }
            });
          },
        ),
        Text("line bar"),
        Text("timer"),
        Text("fullscreen"),
      ],
    );
  }
}