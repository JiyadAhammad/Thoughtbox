// To parse this JSON data, do
//
//     final jobList = jobListFromJson(jsonString);

import 'dart:convert';

List<JobList> jobListFromJson(String str) =>
    List<JobList>.from(json.decode(str).map((x) => JobList.fromJson(x)));

String jobListToJson(List<JobList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobList {
  JobList({
    this.id,
    this.company,
    this.position,
    this.location,
    this.skillsRequired,
    this.date,
    this.image,
  });

  int? id;
  String? company;
  String? position;
  String? location;
  String? skillsRequired;
  String? date;
  String? image;

  factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        id: json["id"],
        company: json["company"] as String,
        position: json["position"] as String,
        location: json["location"] as String,
        skillsRequired: json["skills_required"] as String,
        date: json["date"] as String,
        image: json["image"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "position": position,
        "location": location,
        "skills_required": skillsRequired,
        "date": date,
        "image": image,
      };
}
