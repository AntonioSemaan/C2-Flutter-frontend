import 'package:c2_antonio_hany/data_classes/user_skill.dart';
import 'package:c2_antonio_hany/data_classes/user_experience.dart';
import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/managers/api_Interfaces/i_profile_api_repo.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';

class ProfileApiRepo implements IProfileApiRepo {
  APIManager apiManager = new APIManager();

  @override
  Future<Map<String, dynamic>?> getUserEducation(int userId) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic>? responseBody =
        await apiManager.get("C2/user/education", params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserExperience(int userId) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic>? responseBody =
        await apiManager.get("C2/user/experience", params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserSkills(int userId) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic>? responseBody =
        await apiManager.get("C2/user/skills", params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> updateUserEducation(
      int userId, UserEducation education) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic> body = education.toJsonMap();

    Map<String, dynamic>? responseBody =
        await apiManager.put("C2/user/education", body, params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> updateUserExperience(
      int userId, UserExperience experience) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic> body = experience.toJsonMap();

    Map<String, dynamic>? responseBody =
        await apiManager.put("C2/user/experience", body, params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }

  @override
  Future<Map<String, dynamic>?> updateUserSkills(
      int userId, List<UserSkill> skills) async {
    Map<String, String> params = {"userId": userId.toString()};

    List<Map<String, dynamic>> body = skills.map((e) => e.toJsonMap()).toList();

    Map<String, dynamic>? responseBody =
        await apiManager.put("C2/user/experience", body, params: params);
    if (responseBody == null || responseBody["data"] == null) {
      return {"errorMessage": "Something went wrong, please try again."}
          .cast<String, dynamic>();
    } else {
      return responseBody["data"];
    }
  }
}
