import 'dart:convert';

class User {
  int userId;
  String username;
  String firstName;
  String lastName;
  String email;
  String title;
  String? password;

  User({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.title,
    this.password,
  });

  String get fullname => firstName + " " + lastName;

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> toReturn = {
      "id": userId,
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "title": title
    };

    if (password != null) {
      toReturn["password"] = password;
    }

    return toReturn;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }

  User.fromJson(data)
      : userId = data["id"].runtimeType == String
            ? int.parse(data["id"])
            : data["id"],
        username = data["username"],
        firstName = data["firstName"],
        lastName = data["lastName"],
        email = data["email"],
        title = data["title"];

  User.fromJsonJob(data)
      : userId = data["userId"].runtimeType == String
            ? int.parse(data["userId"])
            : data["userId"],
        username = data["userUsername"],
        firstName = data["userFirstName"],
        lastName = data["userLastName"],
        email = data["userEmail"],
        title = data["userTitle"];
}
