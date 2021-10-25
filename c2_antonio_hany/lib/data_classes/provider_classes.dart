import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/data_classes/user_experience.dart';
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

class EducationListWrapper extends ChangeNotifier {
  List<UserEducation> _userEducations = [];

  List<UserEducation> get value => _userEducations;

  set initValue(List<UserEducation> educations) {
    _userEducations = educations;
  }

  set value(List<UserEducation> educations) {
    _userEducations = educations;
    notifyListeners();
  }
}

class ExperienceListWrapper extends ChangeNotifier {
  List<UserExperience> _userExperiences = [];

  List<UserExperience> get value => _userExperiences;

  set initValue(List<UserExperience> experiences) {
    _userExperiences = experiences;
  }

  set value(List<UserExperience> experiences) {
    _userExperiences = experiences;
    notifyListeners();
  }
}

class JobsListWrapper extends ChangeNotifier {
  List<Job> _userJobs = [];

  List<Job> get value => _userJobs;

  set initValue(List<Job> jobs) {
    _userJobs = jobs;
  }

  set value(List<Job> jobs) {
    _userJobs = jobs;
    notifyListeners();
  }
}

class UserIdWrapper {
  int value;

  UserIdWrapper(this.value);
}

class SearchTextWrapper extends ChangeNotifier {
  String _value = "";

  String get value => _value;

  set value(newValue) {
    _value = newValue;
    notifyListeners();
  }
}
