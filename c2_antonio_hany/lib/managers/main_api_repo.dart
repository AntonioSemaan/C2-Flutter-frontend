import 'package:c2_antonio_hany/managers/api/job_api_repo.dart';
import 'package:c2_antonio_hany/managers/api/profile_api_repo.dart';
import 'package:c2_antonio_hany/managers/api/user_api_repo.dart';

class MainApiRepo {
  static final UserApiRepo userApiRepo = UserApiRepo();
  static final JobApiRepo jobApiRepo = JobApiRepo();
  static final ProfileApiRepo profileApiRepo = ProfileApiRepo();
}
