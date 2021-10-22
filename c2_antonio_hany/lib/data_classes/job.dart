import 'dart:convert';

import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/enums.dart';

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
      this.creationDate});

  Job.fromJson(Map<String, dynamic> data) {
    id = data["jobId"];
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
    title = data["JobTitle"];
    description = data["jobDescription"];
    salaryFrom = data["jobSalaryFrom"];
    salaryTo = data["jobSalaryTo"];
    deadline = data["jobDeadline"];
    creationDate = data["jobCreationDate"];
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
      toReturn["userId"] = user!.toJson();
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
      toReturn["deadline"] = deadline;
    }
    if (creationDate != null) {
      toReturn["creationDate"] = creationDate;
    }
    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
