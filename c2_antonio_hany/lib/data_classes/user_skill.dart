import 'dart:convert';

class UserSkill {
  String? name;

  UserSkill(this.name);

  UserSkill.fromJson(data) {
    name = data["name"];
  }

  Map<String, dynamic> toJsonMap() {
    return {
      "name": name!,
    };
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
