import 'package:c2_antonio_hany/data_classes/logged_user.dart';
import 'package:c2_antonio_hany/managers/api_Interfaces/i_user_api_repo.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

// Api Version 1.5

class UserApiRepo implements IUserApiRepo {
  final APIManager _apiManager = APIManager();

  @override
  Future<LoggedUser?> signUp(String username, String password, String email,
      String firstName, String lastName, String title) async {
    Map<String, String> params = {
      "username": username,
      "password": password,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "title": title,
    };
    Response? response = await _apiManager.get("/C2/user/", params: params);
    if (response == null) {
      return null;
    }
    return LoggedUser.fromJson(response.body);
  }

  @override
  Future<LoggedUser?> logIn(String username, String password) async {
    Map<String, String> params = {
      "username": username,
      "password": password,
    };
    Response? response =
        await _apiManager.post("/C2/user/", {}, params: params);
    if (response == null) {
      return null;
    }
    return LoggedUser.fromJson(response.body);
  }
}
