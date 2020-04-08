import 'package:netflikss/model/Season.dart';

class Serie {
   String label;
   String directoryName;
   List<Season> seasons = <Season>[];


  Serie(this.label, this.directoryName, this.seasons);

   Serie.fromJson(Map<String, dynamic> json)
       : label = json['label'],
         directoryName = json['directoryName'],
         seasons = json['episodes'].map((mapping) => Season.fromJson(json)).toList();

   Map<String, dynamic> toJson() =>
       {
         'label': label,
         'directoryName': directoryName,
         'seasons': seasons
       };
}