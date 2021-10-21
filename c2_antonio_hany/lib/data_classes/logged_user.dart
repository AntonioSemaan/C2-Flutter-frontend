class LoggedUser {
  int userId;
  String username;
  String firstName;
  String lastName;
  String title;

  LoggedUser(
      {required this.userId,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.title});

  String get fullname => firstName + " " + lastName;

  LoggedUser.fromJson(data)
      : userId = data["id"],
        username = data["username"],
        firstName = data["firstName"],
        lastName = data["lastName"],
        title = data["title"];
}
