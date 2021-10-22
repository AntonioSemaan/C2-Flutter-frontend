import 'package:c2_antonio_hany/enums.dart';
import 'package:flutter/cupertino.dart';

class ProfilePageViewWrapper extends ChangeNotifier {
  ProfilePageView _value = ProfilePageView.PERSONAL_INFO;

  ProfilePageView get value => _value;

  void set value(ProfilePageView view) {
    _value = view;
    notifyListeners();
  }
}
