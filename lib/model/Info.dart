class Info {
  String directory;
  String label;
  String stockPath;
  String img;
  String type;

  Info(this.directory, this.label, this.stockPath, this.img , this.type);

  Info.fromJson(Map<String, dynamic> json)
      : directory = json['directory'],
        label = json['label'],
        stockPath = json['stockPath'],
        img = json['img'],
        type = json['type'];

  Map<String, dynamic> toJson() =>
      {
        'directory': directory,
        'label': label,
        'stockPath': stockPath,
        'img': img,
        'type': type
      };

  @override
  String toString() {
    return ' Info { directory : $directory, label : $label, stockPath : $stockPath, img : $img,type : $type  }';
  }
}