import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:http/http.dart';

abstract class IUserApiRepo {
  Future<Map<String, dynamic>?> signUp(String username, String password,
      String email, String firstName, String lastName, String title);

  Future<Map<String, dynamic>?> logIn(String username, String password);

  Future<Map<String, dynamic>?> fetchUser(int userId);

  Future<Map<String, dynamic>?> updateUser(User user);
}
