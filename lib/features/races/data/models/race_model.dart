/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'package:racemate/features/races/domain/entities/race_entity.dart';

RaceModel raceModelFromJson(String str) => RaceModel.fromJson(json.decode(str));

String raceModelToJson(RaceModel data) => json.encode(data.toJson());

class RaceModel extends RaceEntity{
    RaceModel({
        required this.date,
        required this.country,
        required this.image,
        required this.distances,
        required this.city,
        required this.name,
        required this.type,
    }) : super(date: date, country: country, image: image, distances: distances, city: city, name: name, type: type);

    String date;
    String country;
    String image;
    String distances;
    String city;
    String name;
    String type;

    factory RaceModel.fromJson(Map<dynamic, dynamic> json) => RaceModel(
        date: json["date"],
        country: json["country"],
        image: json["image"],
        distances: json["distances"],
        city: json["city"],
        name: json["name"],
        type: json["type"],
    );

    Map<dynamic, dynamic> toJson() => {
        "date": date,
        "country": country,
        "image": image,
        "distances": distances,
        "city": city,
        "name": name,
        "type": type,
    };
}
