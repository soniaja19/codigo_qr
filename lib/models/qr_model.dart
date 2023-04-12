class QRModel {
  String title;
  String observation;
  String url;
  String datetime;
  QRModel({
    required this.title,
    required this.observation,
    required this.url,
    required this.datetime,
  });
  //QRModel Este es un modelo, que tiene parámetros
  factory QRModel.fromJson(Map<String, dynamic> json) => QRModel(
        title: json["title"] ?? "",
        observation: json["observation"],
        url: json["url"],
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "Observation": observation,
        "url": url,
        "datetime": datetime,
      };
}
