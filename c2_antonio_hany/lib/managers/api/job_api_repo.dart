import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/managers/api_Interfaces/i_job_api_repo.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';

class JobApiRepo implements IJobApiRepo {
  final APIManager _apiManager = APIManager();

  @override
  Future<Map<String, dynamic>?> create(Job job) async {
    Map<String, dynamic> body = job.toJsonMap();
    Map<String, dynamic>? responseBody = await _apiManager.put("v1/job/", body);
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
  Future<Map<String, dynamic>?> delete(Job job) async {
    Map<String, String> params = {
      "jobId": job.id.toString(),
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.delete("v1/job/", params: params);
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
  Future<Map<String, dynamic>?> fetchByEnum(JobEnum? jobEnum,
      String? searchText, JobFiltersSorts filtersSorts) async {
    Map<String, String> params = {};
    if (jobEnum != null) {
      params["jobEnum"] = jobEnum.value.toString();
    }
    if (searchText != null) {
      params["search"] = searchText;
    }
    Map<String, dynamic> body = filtersSorts.toJsonMap();

    Map<String, dynamic>? responseBody =
        await _apiManager.post("v1/job/", body, params: params);
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
  Future<Map<String, dynamic>?> fetchByUser(int userId) async {
    Map<String, String> params = {
      "userId": userId.toString(),
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.post("v1/job/user", {}, params: params);
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
