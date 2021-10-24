import 'dart:convert';

import 'package:c2_antonio_hany/data_classes/comment.dart';
import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/globals.dart';

class Job {
  int? id;
  JobEnum? jobEnum;
  User? user;
  JobType? jobType;
  JobExperience? jobExperience;
  JobEnvironment? jobEnvironment;
  String? title;
  String? description;
  double? salaryFrom;
  double? salaryTo;
  DateTime? deadline;
  DateTime? creationDate;
  List<Comment>? comments;

  Job(
      {this.id,
      this.jobEnum,
      this.user,
      this.jobType,
      this.jobExperience,
      this.jobEnvironment,
      this.title,
      this.description,
      this.salaryFrom,
      this.salaryTo,
      this.deadline,
      this.creationDate,
      this.comments});

  Job.fromJson(Map<String, dynamic> data) {
    id = data["jobId"].runtimeType == String
        ? int.parse(data["jobId"])
        : data["jobId"];
    jobEnum = JobEnumExtension.fromInt(data["jobEnum"]);

    Map<String, dynamic> userData = {};
    data.forEach((key, value) {
      if (key.contains("user")) {
        userData[key] = value;
      }
    });
    user = User.fromJsonJob(userData);

    jobType = JobTypeExtension.fromInt(data["jtId"]);
    jobExperience = JobExperienceExtension.fromInt(data["jexpId"]);
    jobEnvironment = JobEnvironmentExtension.fromInt(data["jenvId"]);
    title = data["jobTitle"];
    description = data["jobDescription"];
    salaryFrom = data["jobSalaryFrom"];
    salaryTo = data["jobSalaryTo"];
    if (data["jobDeadline"] != "") {
      deadline = gDatabaseFormat.parse(data["jobDeadline"]);
    }
    if (data["jobCreationDate"] != "") {
      creationDate = gDatabaseStampFormat.parse(data["jobCreationDate"]);
    }
    if (data["comments"] != null) {
      comments =
          (data["comments"] as List).map((e) => Comment.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};
    if (id != null) {
      toReturn["id"] = id;
    }
    if (jobEnum != null) {
      toReturn["jobEnum"] = jobEnum!.value;
    }
    if (user != null) {
      toReturn["userId"] = user!.userId;
    }
    if (jobType != null) {
      toReturn["type"] = jobType!.value;
    }
    if (jobExperience != null) {
      toReturn["experience"] = jobExperience!.value;
    }
    if (jobEnvironment != null) {
      toReturn["environment"] = jobEnvironment!.value;
    }
    if (title != null) {
      toReturn["title"] = title;
    }
    if (description != null) {
      toReturn["description"] = description;
    }
    if (salaryFrom != null) {
      toReturn["salaryFrom"] = salaryFrom;
    }
    if (salaryTo != null) {
      toReturn["salaryTo"] = salaryTo;
    }
    if (deadline != null) {
      toReturn["deadline"] = gDatabaseFormat.format(deadline!);
    }
    if (creationDate != null) {
      toReturn["creationDate"] = gDatabaseFormat.format(creationDate!);
    }
    if (comments != null) {
      toReturn["comments"] = comments!.map((e) => e.toJsonMap());
    }

    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
