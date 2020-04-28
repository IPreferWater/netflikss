
import 'Info.dart';

class Movie {
  Info info;
  String fileName;

  Movie({this.info, this.fileName});

  static Movie fromJson(Map<String, dynamic> json) {

    return Movie(info: Info.fromJson(json['info']), fileName: json['fileName']);
  }

  Map<String, dynamic> toJson() => {'info': info.toJson(), 'fileName': fileName};

  @override
  String toString() {
    return ' Movie { info : $info, fileName : $fileName }';
  }
}
