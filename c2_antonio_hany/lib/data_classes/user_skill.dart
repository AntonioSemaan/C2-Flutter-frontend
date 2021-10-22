import 'dart:convert';

class UserSkill {
  String? name;

  UserSkill(this.name);

  Map<String, dynamic> toJsonMap() {
    return {
      "name": name!,
    };
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
