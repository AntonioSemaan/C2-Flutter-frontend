import 'dart:convert';

import 'package:c2_antonio_hany/enums.dart';

class JobFilters {
  JobExperience? experience;
  JobEnvironment? environment;
  JobType? type;

  JobFilters({this.experience, this.environment, this.type});

  JobFilters.fromJson(data)
      : experience = JobExperienceExtension.fromInt(data["experience"])!,
        environment = JobEnvironmentExtension.fromInt(data["enivronment"])!,
        type = JobTypeExtension.fromInt(data["type"])!;

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};
    if (experience != null) {
      toReturn["experience"] = experience!.value;
    }
    if (environment != null) {
      toReturn["environment"] = environment!.value;
    }
    if (type != null) {
      toReturn["type"] = type!.value;
    }
    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
