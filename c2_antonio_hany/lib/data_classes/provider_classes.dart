import 'package:c2_antonio_hany/enums.dart';
import 'package:flutter/cupertino.dart';

class ProfilePageViewWrapper extends ChangeNotifier {
  ProfilePageView _value = ProfilePageView.PERSONAL_INFO;

  ProfilePageView get value => _value;

  set value(ProfilePageView view) {
    _value = view;
    notifyListeners();
  }
}

class DashboardJobEnumWrapper extends ChangeNotifier {
  JobEnum _value = JobEnum.ALL;

  JobEnum get value => _value;

  set value(JobEnum view) {
    _value = view;
    notifyListeners();
  }
}
