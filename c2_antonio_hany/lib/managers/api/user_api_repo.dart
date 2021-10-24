import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/managers/api_Interfaces/i_user_api_repo.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

// Api Version 1.5

class UserApiRepo implements IUserApiRepo {
  final APIManager _apiManager = APIManager();

  @override
  Future<Map<String, dynamic>?> signUp(String username, String password,
      String email, String firstName, String lastName, String title) async {
    Map<String, String> params = {
      "username": username,
      "password": password,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "title": title,
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.put("v1/user/", {}, params: params);
    if (responseBody == null || responseBody["data"] == null) {
      if (responseBody!["errorMessage"] != null) {
        return responseBody;
      }
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> logIn(String username, String password) async {
    Map<String, String> params = {
      "username": username,
      "password": password,
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.post("v1/user/", {}, params: params);
    if (responseBody == null || responseBody["data"] == null) {
      if (responseBody!["errorMessage"] != null) {
        return responseBody;
      }
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchUser(int userId) async {
    Map<String, String> params = {
      "userId": userId.toString(),
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.get("v1/user/", params: params);
    if (responseBody == null || responseBody["data"] == null) {
      if (responseBody!["errorMessage"] != null) {
        return responseBody;
      }
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }
}
