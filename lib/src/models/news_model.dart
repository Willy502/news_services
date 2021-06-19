// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {

  String? id;
  String? title;
  String? date;
  String? description;
  String? imgUrl;

    NewsModel({
        this.id,
        this.title,
        this.date,
        this.description,
        this.imgUrl,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
        imgUrl: json["img_url"],
    );

    Map<String, dynamic> toJson() => {
        //"id": id,
        "title": title,
        "date": date,
        "description": description,
        "img_url": imgUrl,
    };
}
