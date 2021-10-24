import 'dart:convert';
import 'dart:html';

import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/globals.dart';

class Comment {
  int? id;
  late User user;
  late int jobId;
  late String content;
  DateTime? creationDate;

  Comment(
      {this.id,
      required this.user,
      required this.content,
      this.creationDate});

  Comment.fromJson(data) {
    if (data["id"] != null) {
      id =
          data["id"].runtimeType == String ? int.parse(data["id"]) : data["id"];
    }
    user = User.fromJson(data["user"]);
    jobId = data["jobId"].runtimeType == String
        ? int.parse(data["jobId"])
        : data["jobId"];
    content = data["content"];
    if (data["creationDate"] != null) {
      creationDate = gDatabaseStampFormat.parse(data["creationDate"]);
    }
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};

    if (id != null) {
      toReturn["id"] = id;
    }
    toReturn["user"] = user.toJson();
    toReturn["content"] = content;
    if (creationDate != null) {
      toReturn["creationDate"] = creationDate;
    }

    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
