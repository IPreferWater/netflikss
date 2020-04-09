class Episode {
  String label;
  String fileName;
  int number;

  Episode(this.label, this.fileName, this.number);

  Episode.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        fileName = json['fileName'],
        number = json['number'];

  Map<String, dynamic> toJson() =>
      {
        'label': label,
        'fileName': fileName,
        'number': number
      };

  @override
  String toString() {
    return ' Episode { label : $label, filename : $fileName, number : $number }';
  }
}