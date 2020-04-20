import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflikss/widget/video_zone.dart';
import 'package:video_player/video_player.dart';
import 'package:netflikss/colors.dart' as Colors;


class VideoPlayerScreen extends StatefulWidget {

  final String url;

  VideoPlayerScreen({Key key, @required this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {

    _controller = VideoPlayerController.network(
      'http://localhost:7171/${widget.url}'
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.youtubeBlack,
      child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: AspectRatio(

                      aspectRatio: _controller.value.aspectRatio,
                        child: VideoZone(videoController: _controller,)
                    ),
                  );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
    );
  }
}