import 'dart:core';

import 'package:netflikss/model/Episode.dart';

class Season {
  String label;
  String directoryName;
  int number;
  List<Episode> episodes;

  Season({this.label, this.directoryName, this.number, this.episodes});

  static Season fromJson(Map<String, dynamic> json) {
    var episodeJson = json['episodes'];

    List<Episode> episodes;
    if (episodeJson != null) {
      episodes = episodeJson
          .map((episode) => Episode.fromJson(episode))
          .toList()
          .cast<Episode>();
    } else {
      episodes = [];
    }
    return Season(
        label: json['label'],
        directoryName: json['directoryName'],
        number: json['number'],
        episodes: episodes);
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'directoryName': directoryName,
        'number': number,
        'episodes': episodes
      };

  @override
  String toString() {
    return ' Season { number : $number, label : $label, directoryName : $directoryName, episode : $episodes }';
  }
}
