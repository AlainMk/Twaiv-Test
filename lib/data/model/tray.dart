import 'package:twaiv_test/data/model/fruit.dart';

class Tray {
  final String name;
  final List<Fruit> fruits;

  Tray({required this.name, required this.fruits});

  factory Tray.fromJson(Map<String, dynamic> json) {
    return Tray(
      name: json['name'],
      fruits: Fruit.fromJsonList(json['fruits']),
    );
  }

  /// from json list constructor
  static List<Tray> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((e) => Tray.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['fruits'] = fruits.map((e) => e.toJson()).toList();
    return data;
  }
}
