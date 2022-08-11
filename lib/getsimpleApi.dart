// To parse this JSON data, do
//
//     final getSampleApi = getSampleApiFromJson(jsonString);

import 'dart:convert';

List<GetSampleApi> getSampleApiFromJson(String str) => List<GetSampleApi>.from(
    json.decode(str).map((x) => GetSampleApi.fromJson(x)));

String getSampleApiToJson(List<GetSampleApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSampleApi {
  GetSampleApi({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory GetSampleApi.fromJson(Map<String, dynamic> json) => GetSampleApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
