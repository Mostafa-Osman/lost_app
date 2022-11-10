
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';

class Governorate extends SelectableItem {
  final List<City> cities;

  Governorate({
    required int id,
    required String title,
    required this.cities,
  }) : super(id: id, title: title);

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
        id: json['ID'] as int,
        title: json['title'] as String,
        cities: (json['cities'] as List)
            .map((e) => City.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class City extends SelectableItem {
  City({
    required int id,
    required String title,
  }) : super(id: id, title: title);

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['ID'] as int,
        title: json['title'] as String,
      );
}
