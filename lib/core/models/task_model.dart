import 'dart:core';

class TaskModel {
  String id;
  String userId;
  String title;
  String desc;
  String time;
  int date;
  bool isDone;

  TaskModel(
      {this.id = "",
      this.userId="",
      required this.title,
      required this.desc,
      required this.time,
      required this.date,
      required this.isDone});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        time: json["time"],
        date: json["date"],
        isDone: json["isDone"],
        userId: json["userId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "time":time,
      "date": date,
      "isDone": isDone,
      "user":userId
    };
  }
}
