import 'package:c2_antonio_hany/managers/api_Interfaces/i_comment_api_repo.dart';
import 'package:c2_antonio_hany/managers/api_manager.dart';

class CommentApiRepo extends ICommentApiRepo {
  final APIManager _apiManager = APIManager();

  @override
  Future<Map<String, dynamic>?> addComment(
      int userId, int jobId, String comment) async {
    Map<String, dynamic> body = {"content": comment};
    Map<String, String> params = {
      "jobId": jobId.toString(),
      "userId": userId.toString(),
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.put("Jobook/v1/comment/", body, params: params);
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
  Future<Map<String, dynamic>?> deleteComment(int commentId) async {
    Map<String, String> params = {
      "commentId": commentId.toString(),
    };
    Map<String, dynamic>? responseBody =
        await _apiManager.delete("Jobook/v1/comment/", params: params);
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
