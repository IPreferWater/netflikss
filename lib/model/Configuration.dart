class Configuration {
  String stockPath;

  Configuration(this.stockPath);

  Configuration.fromJson(Map<String, dynamic> json)
      : stockPath = json['stockPath'];

  Map<String, dynamic> toJson() => {'stockPath': stockPath};

  @override
  String toString() {
    return ' Configuration { stockPath : $stockPath}';
  }
}
