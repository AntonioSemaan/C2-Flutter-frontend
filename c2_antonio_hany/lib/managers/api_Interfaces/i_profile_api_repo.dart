import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/data_classes/user_experience.dart';
import 'package:c2_antonio_hany/data_classes/user_skill.dart';

abstract class IProfileApiRepo {
  Future<Map<String, dynamic>?> getUserEducation(int userId);

  Future<Map<String, dynamic>?> updateUserEducation(
      int userId, UserEducation education);

  Future<Map<String, dynamic>?> getUserExperience(int userId);

  Future<Map<String, dynamic>?> updateUserExperience(
      int userId, UserExperience experience);

  Future<Map<String, dynamic>?> getUserSkills(int userId);

  Future<Map<String, dynamic>?> updateUserSkills(
      int userId, List<UserSkill> skills);
}
