import 'dart:core';

import 'package:netflikss/model/Episode.dart';

class Season {
  String label;
  String directoryName;
  int number;
  List<Episode> episodes = <Episode>[];

  Season(this.label, this.directoryName, this.number, this.episodes);

  Season.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        directoryName = json['directoryName'],
        number = json['number'];
       // episodes = json['episodes'].map((mapping) => Episode.fromJson(json)).toList();

  Map<String, dynamic> toJson() =>
      {
        'label': label,
        'directoryName': directoryName,
        'number': number,
        'episodes': episodes
      };
}