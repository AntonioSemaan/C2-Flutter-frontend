import 'package:c2_antonio_hany/data_classes/logged_user.dart';
import 'package:http/http.dart';

abstract class IUserApiRepo {
  Future<LoggedUser?> signUp(String username, String password, String email, String firstName, String lastName, String title);

  Future<LoggedUser?> logIn(String username, String password);
}
