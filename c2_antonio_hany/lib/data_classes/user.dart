import 'dart:convert';

class User {
  int userId;
  String username;
  String firstName;
  String lastName;
  String email;
  String title;

  User(
      {required this.userId,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.title});

  String get fullname => firstName + " " + lastName;

  String toJson() {
    return jsonEncode({
      "id": userId,
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "title": title
    });
  }

  User.fromJson(data)
      : userId = data["id"],
        username = data["username"],
        firstName = data["firstName"],
        lastName = data["lastName"],
        email = data["email"],
        title = data["title"];

  User.fromJsonJob(data)
      : userId = data["userId"],
        username = data["userUsername"],
        firstName = data["userFirstName"],
        lastName = data["userLastName"],
        email = data["userEmail"],
        title = data["userTitle"];
}
