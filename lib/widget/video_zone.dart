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

  bool _showMediaControl;
  Timer timerMouseActive;
  Timer timerVideo;

  @override
  void dispose() {
    super.dispose();
    cancelTimer(timerMouseActive);
    cancelTimer(timerVideo);
  }

  @override
  void initState() {
    super.initState();
    _showMediaControl = false;
  }

    _mouseMoving(PointerEvent details) async {
    if(!_showMediaControl){
      setState(() {
        _showMediaControl = true;
      });
    }

    cancelTimer(timerMouseActive);

    timerMouseActive = Timer(Duration(seconds: 3), () {
      setState(() {
        _showMediaControl = false;
      });
    });
  }

  startTimer() {
    timerVideo = Timer.periodic(const Duration(seconds: 1), (timer) {
      //refresh state to put the correct slider position
      setState(() {});

      //is the video finished ?
      if(!widget.videoController.value.isPlaying){
        cancelTimer(timerVideo);
      }
    });
  }

  cancelTimer(Timer timer) {
    if(timer == null){
      return;
    }
    if(!timer.isActive){
      return;
    }
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: _mouseMoving,
        child: Stack(
            children: <Widget>[
              VideoPlayer(widget.videoController),
              //TODO: we need to capsule the two widget in a single one
              AnimatedOpacity(
                opacity: _showMediaControl ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Align(
                  alignment:Alignment.topCenter,
                  child: Container(
                      constraints: BoxConstraints.tightForFinite(
                        height: 50,
                      ),
                      color: Colors.transparent.withOpacity(0.5),
                      child :_buildTopMediaControl()
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _showMediaControl ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Align(
                  alignment:Alignment.bottomCenter,
                  child: Container(
                      constraints: BoxConstraints.tightForFinite(
                        height: 50,
                      ),
                      color: Colors.transparent.withOpacity(0.5),
                      child :_buildMediaControl()
                  ),
                ),
              )
            ],
                overflow: Overflow.visible,
        )
    );
  }

  Widget _getDurationFormat(){
    var durationBeforeEnd = widget.videoController.value.duration - widget.videoController.value.position;
    String formatedDuration = durationBeforeEnd.toString().split('.').first.padLeft(8, "0");
    return Text(formatedDuration,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildTopMediaControl(){
    return Row(
      children: <Widget>[
        _backButton(),
      ],
    );
  }

  Widget _backButton(){
    return IconButton(
      color: Colors.white,
      icon: Icon(Icons.arrow_back),
      tooltip: 'back',
      onPressed: () {
        cancelTimer(timerVideo);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildMediaControl(){
    return Row(
      children: <Widget>[
        _playPauseButton(),
        _sliderVideo(),
        _getDurationFormat(),
        //_fullScreenButton()
      ],
    );
  }

  Widget _playPauseButton(){
    return IconButton(
      color: Colors.white,
      icon: Icon(widget.videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,),
      tooltip: 'play',
      onPressed: () {
        setState(() {
          if (widget.videoController.value.isPlaying) {
            cancelTimer(timerVideo);
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
      value :widget.videoController.value.position.inSeconds.toDouble(),
      activeColor: Colors.white,
      onChanged: (newPosition) {
        //TODO the onChanged is not perfect when we set the position it can go back a little bit
        widget.videoController.seekTo(Duration(seconds: newPosition.toInt()));
        //refresh state to put the correct slider position
        setState(() {});
      },
      min: 0,
      max: widget.videoController.value.duration.inSeconds.toDouble()
    );
  }

  Widget _fullScreenButton(){
    return IconButton(
      color: Colors.white,
      icon: Icon(Icons.fullscreen),
      tooltip: 'fullscreen',
      onPressed: () {
        //TODO need to make a fullscreen on navigator
        //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      },
    );
  }
}