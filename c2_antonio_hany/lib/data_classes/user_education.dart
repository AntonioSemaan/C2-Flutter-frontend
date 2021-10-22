import 'dart:convert';

import 'package:c2_antonio_hany/globals.dart';

class UserEducation {
  int? id;
  String? name;
  String? degree;
  String? domain;
  DateTime? dateFrom;
  DateTime? dateTo;
  DateTime? creationDate;

  UserEducation(
      {this.id,
      this.name,
      this.degree,
      this.domain,
      this.dateFrom,
      this.dateTo,
      this.creationDate});

  UserEducation.fromJson(data) {
    if (data["data"] != null) {
      id = data["id"];
    }
    if (data["name"] != null) {
      name = data["name"];
    }
    if (data["degree"] != null) {
      degree = data["degree"];
    }
    if (data["domain"] != null) {
      domain = data["domain"];
    }
    if (data["dateFrom"] != null) {
      dateFrom = gDatabaseFormat.parse(data["dateFrom"]);
    }
    if (data["dateTo"] != null) {
      dateTo = gDatabaseFormat.parse(data["dateTo"]);
    }
    if (data["creationDate"] != null) {
      creationDate = gDatabaseStampFormat.parse(data["creationDate"]);
    }
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};
    if (id != null) {
      toReturn["id"];
    }
    if (name != null) {
      toReturn["name"] = name;
    }
    if (degree != null) {
      toReturn["degree"] = degree;
    }
    if (domain != null) {
      toReturn["domain"] = domain;
    }
    if (dateFrom != null) {
      toReturn["dateFrom"] = gDatabaseFormat.format(dateFrom!);
    }
    if (dateTo != null) {
      toReturn["dateTo"] = gDatabaseFormat.format(dateTo!);
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
