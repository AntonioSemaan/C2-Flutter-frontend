import 'dart:convert';

import 'package:c2_antonio_hany/globals.dart';

class UserExperience {
  int? id;
  String? company;
  String? title;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? description;
  DateTime? creationDate;

  UserExperience(
      {this.id,
      this.company,
      this.title,
      this.dateFrom,
      this.dateTo,
      this.description,
      this.creationDate});

  UserExperience.fromJson(data) {
    if (data["id"] != null) {
      id = data["id"];
    }
    if (data["company"] != null) {
      company = data["company"];
    }
    if (data["title"] != null) {
      title = data["title"];
    }
    if (data["dateFrom"] != null) {
      dateFrom = gDatabaseFormat.parse(data["dateFrom"]);
    }
    if (data["dateTo"] != null) {
      dateTo = gDatabaseFormat.parse(data["dateTo"]);
    }
    if (data["description"] != null) {
      description = data["description"];
    }
    if (data["creationDate"] != null) {
      creationDate = gDatabaseStampFormat.parse(data["creationDate"]);
    }
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};

    if (id != null) {
      toReturn["id"] = id;
    }
    if (company != null) {
      toReturn["company"] = company;
    }
    if (title != null) {
      toReturn["title"] = title;
    }
    if (dateFrom != null) {
      toReturn["dateFrom"] = gDatabaseFormat.format(dateFrom!);
    }
    if (dateTo != null) {
      toReturn["dateTo"] = gDatabaseFormat.format(dateTo!);
    }
    if (description != null) {
      toReturn["description"] = description;
    }

    if (creationDate != null) {
      toReturn["creationDate"] = gDatabaseStampFormat.format(creationDate!);
    }

    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
