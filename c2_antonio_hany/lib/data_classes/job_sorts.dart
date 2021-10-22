import 'dart:convert';

class JobSorts {
  late bool newestDate, oldestDate, nameAscending, nameDescending;

  JobSorts(
      {this.newestDate = true,
      this.oldestDate = false,
      this.nameAscending = true,
      this.nameDescending = false});

  JobSorts.fromJson(Map<String, dynamic> data) {
    if (data["date"] != null) {
      newestDate = data["date"]["newest"] ?? false;
      oldestDate = data["date"]["oldest"] ?? false;

      if (!newestDate && !oldestDate) {
        newestDate = true;
      }
    } else {
      newestDate = true;
      oldestDate = false;
    }
    if (data["name"] != null) {
      nameAscending = data["name"]["ascending"] ?? false;
      nameDescending = data["name"]["descending"] ?? false;

      if (!nameAscending && !nameDescending) {
        nameAscending = true;
      }
    } else {
      nameAscending = true;
      nameDescending = false;
    }
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {};

    toReturn["date"] = {
      "newest": newestDate,
      "oldest": oldestDate,
    };
    toReturn["name"] = {
      "ascending": nameAscending,
      "descending": nameDescending,
    };
    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
