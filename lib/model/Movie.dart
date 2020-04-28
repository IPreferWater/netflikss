
import 'Info.dart';
import 'Wrap.dart';

class Movie extends WrapNetflikss {
  Info info;
  String fileName;

  Movie({this.info, this.fileName}) : super(info : info);

  static Movie fromJson(Map<String, dynamic> json) {

    return Movie(info: Info.fromJson(json['info']), fileName: json['fileName']);
  }

  Map<String, dynamic> toJson() => {'info': info.toJson(), 'fileName': fileName};

  @override
  String toString() {
    return ' Movie { info : $info, fileName : $fileName }';
  }
}
