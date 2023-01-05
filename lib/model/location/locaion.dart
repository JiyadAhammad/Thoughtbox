// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    this.id,
    this.place,
  });

  int? id;
  String? place;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        place: json["place"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
      };
}
