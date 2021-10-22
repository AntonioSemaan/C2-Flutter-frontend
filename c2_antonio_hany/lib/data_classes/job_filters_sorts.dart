import 'dart:convert';

import 'package:c2_antonio_hany/data_classes/job_filters.dart';
import 'package:c2_antonio_hany/data_classes/job_sorts.dart';

class JobFiltersSorts {
  late JobFilters jobFilters;
  late JobSorts jobSorts;

  JobFiltersSorts({required this.jobFilters, required this.jobSorts});

  JobFiltersSorts.fromJson(data) {
    jobFilters = JobFilters.fromJson(data["filters"]);
    jobSorts = JobSorts.fromJson(data["sorts"]);
  }

  Map<String, dynamic> toJsonMap() {
    return {"sorts": jobSorts.toJsonMap(), "filters": jobFilters.toJsonMap()};
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }

  bool anyFiltersIsNotNull() {
    return jobFilters.environment != null ||
        jobFilters.experience != null ||
        jobFilters.type != null;
  }

  bool anySortsIsNotDefault() {
    return jobSorts.nameAscending != true ||
        jobSorts.newestDate != true;
  }

  void resetFiltersAndSorts() {
    jobFilters = JobFilters();
    jobSorts = JobSorts();
  }
}
