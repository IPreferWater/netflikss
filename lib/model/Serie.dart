import 'package:netflikss/model/Season.dart';
import 'package:netflikss/model/wrap_netflikss.dart';

import 'Info.dart';

class Serie extends WrapNetflikss {
  Info info;
  List<Season> seasons;

  Serie({this.info, this.seasons}) : super(info: info);

  static Serie fromJson(Map<String, dynamic> json) {
    var seasonsJson = json['seasons'];
    List<Season> seasons;
    if (seasonsJson != null) {
      seasons = seasonsJson
          .map((season) => Season.fromJson(season))
          .toList()
          .cast<Season>();
    } else {
      seasons = [];
    }

    return Serie(info: Info.fromJson(json['info']), seasons: seasons);
  }

  Map<String, dynamic> toJson() => {'info': info.toJson(), 'seasons': seasons};

  @override
  String toString() {
    return ' Serie { info : $info, seasons : $seasons }';
  }
}
