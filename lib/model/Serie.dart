import 'package:netflikss/model/Season.dart';

class Serie {
   String label;
   String directoryName;
   String stockPath;
   List<Season> seasons;

  Serie({
      this.label,
      this.directoryName,
      this.stockPath,
      this.seasons});

   static Serie fromJson(Map<String, dynamic> json) {

    var seasonsJson = json['seasons'];
    List<Season> seasons;
    if(seasonsJson != null){
      seasons = seasonsJson.map((season) => Season.fromJson(season)).toList().cast<Season>();
    }else{

      seasons=[];
    }

     return Serie(
         label: json['label'],
         directoryName: json['directoryName'],
         stockPath: json['stockPath'],
         seasons: seasons);
   }

   Map<String, dynamic> toJson() =>
       {
         'label': label,
         'directoryName': directoryName,
         'seasons': seasons
       };

   @override
   String toString() {
     return ' Serie { label : $label, directoryName : $directoryName, seasons : $seasons }';
   }
}