import 'Info.dart';

abstract class WrapNetflikss {
  Info info;

  WrapNetflikss({this.info});

  @override
  String toString() {
    return ' Wrap { info : $info}';
  }

  String buildUrl(String fileName) {
    return "${info.stockPath}/${info.directory}/$fileName";
  }
}
