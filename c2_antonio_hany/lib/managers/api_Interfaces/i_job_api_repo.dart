import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/enums.dart';

abstract class IJobApiRepo {
  Future<Map<String,dynamic>?> fetchByEnum(JobEnum jobEnum,String searchText,JobFiltersSorts filtersSorts);

  Future<Map<String,dynamic>?> fetchByUser(int userId);

  Future<Map<String,dynamic>?> create(Job job);

  Future<Map<String,dynamic>?> delete(Job job);
}
