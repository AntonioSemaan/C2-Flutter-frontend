import 'dart:convert';

import 'package:c2_antonio_hany/data_classes/user.dart';
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
        await apiManager.get("v1/user/education", params: params);
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
  Future<Map<String, dynamic>?> getUserExperience(int userId) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic>? responseBody =
        await apiManager.get("v1/user/experience", params: params);
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
  Future<Map<String, dynamic>?> getUserSkills(int userId) async {
    Map<String, String> params = {"userId": userId.toString()};

    Map<String, dynamic>? responseBody =
        await apiManager.get("v1/user/skills", params: params);
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
  Future<Map<String, dynamic>?> updateUserEducation(
      int userId, List<UserEducation> educations) async {
    Map<String, String> params = {"userId": userId.toString()};

    List<Map<String, dynamic>> bodyList =
        educations.map((e) => e.toJsonMap()).toList();

    Map<String, dynamic> body = {"education": bodyList};

    Map<String, dynamic>? responseBody =
        await apiManager.put("v1/user/education", body, params: params);
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
  Future<Map<String, dynamic>?> updateUserExperiences(
      int userId, List<UserExperience> experiences) async {
    Map<String, String> params = {"userId": userId.toString()};

    List<dynamic> bodyList = experiences.map((e) => e.toJsonMap()).toList();

    Map<String, dynamic> body = {"experience": bodyList};

    Map<String, dynamic>? responseBody =
        await apiManager.put("v1/user/experience", body, params: params);
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
  Future<Map<String, dynamic>?> updateUserSkills(
      int userId, List<UserSkill> skills) async {
    Map<String, String> params = {"userId": userId.toString()};

    List<Map<String, dynamic>> bodyList =
        skills.map((e) => e.toJsonMap()).toList();

    Map<String, dynamic> body = {"skills": bodyList};

    Map<String, dynamic>? responseBody =
        await apiManager.put("v1/user/skills", body, params: params);
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
  Future<Map<String, dynamic>?> updateUser(User user) async {
    Map<String, String> params = {"userId": user.userId.toString()};

    Map<String, dynamic> body = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "title": user.title
    };

    Map<String, dynamic>? responseBody =
        await apiManager.put("v1/user/personalInfo", body, params: params);
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
