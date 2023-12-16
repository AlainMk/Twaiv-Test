import 'package:twaiv_test/data/model/fruit.dart';

class Basket {
  final String id;
  final String name;
  final List<Fruit> fruits;

  Basket({required this.id, required this.name, required this.fruits});

  factory Basket.fromJson(Map<String, dynamic> json) {
    return Basket(
      id: json['id'],
      name: json['name'],
      fruits: Fruit.fromJsonList(json['fruits']),
    );
  }

  /// from json list constructor
  static List<Basket> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((e) => Basket.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['fruits'] = fruits.map((e) => e.toJson()).toList();
    return data;
  }
}
