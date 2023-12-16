class Fruit {
  final String id;
  final String name;
  final String image;
  final int backgroundColor;

  Fruit({
    required this.id,
    required this.name,
    required this.image,
    required this.backgroundColor,
  });

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      backgroundColor: json['background_color'],
    );
  }

  /// from json list constructor
  static List<Fruit> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((e) => Fruit.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['background_color'] = backgroundColor;
    return data;
  }
}
