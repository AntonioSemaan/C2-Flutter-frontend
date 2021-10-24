import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/enums.dart';

abstract class ICommentApiRepo {
  Future<Map<String,dynamic>?> addComment(int userId,int jobId, String comment);

  Future<Map<String,dynamic>?> deleteComment(int commentId);
}
