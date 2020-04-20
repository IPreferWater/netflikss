import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoZone extends StatefulWidget {

  final VideoPlayerController videoController;

  VideoZone({@required this.videoController});

  @override
  _VideoZoneState createState() => _VideoZoneState();
}

class _VideoZoneState extends State<VideoZone> {

  double maxSecond;
  double position;
  Timer timer;

  @override
  void initState() {
    super.initState();
    maxSecond = widget.videoController.value.duration.inSeconds.toDouble();
    position = widget.videoController.value.position.inSeconds.toDouble();
  }

  void _mouseMoving(PointerEvent details) {
    print('the mouse is mooving');
  }

  startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        position = widget.videoController.value.position.inSeconds.toDouble();
        });
    });
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: _mouseMoving,
        child: Stack(
            children: <Widget>[
              VideoPlayer(widget.videoController),
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
        _playPauseButton(),
        _sliderVideo(),
        Text("timer"),
        Text("fullscreen"),
      ],
    );
  }

  Widget _playPauseButton(){
    return IconButton(
      icon: Icon(widget.videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,),
      tooltip: 'play',
      onPressed: () {
        setState(() {
          if (widget.videoController.value.isPlaying) {
            cancelTimer();
            widget.videoController.pause();
          } else {
            startTimer();
            widget.videoController.play();
          }
        });
      },
    );
  }

  Widget _sliderVideo(){

    return Slider(
      value :position,
      onChanged: (newPosition) {
        setState(() {
          widget.videoController.seekTo(Duration(seconds: newPosition.toInt()));
        });
      },
      min: 0,
      max: maxSecond,
    );
  }
}