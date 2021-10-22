// ignore_for_file: constant_identifier_names

enum LoginSignUpFlag { SIGNUP, LOGIN }
enum ToolBarForPage { DASHBOARD, PROFILE, CONTACT_US }

enum ProfilePageView { PERSONAL_INFO, EDUCATION, EXPERIENCE, SKILLS }

enum JobEnum { ALL, JOB_REQUEST, JOB_OFFER }

extension JobEnumExtension on JobEnum {
  int get value {
    switch (this) {
      case JobEnum.ALL:
        return 0;
      case JobEnum.JOB_OFFER:
        return 1;
      case JobEnum.JOB_REQUEST:
        return 2;
    }
  }

  static JobEnum? fromInt(int value) {
    switch (value) {
      case 0:
        return JobEnum.ALL;
      case 1:
        return JobEnum.JOB_OFFER;
      case 2:
        return JobEnum.JOB_REQUEST;
    }
  }
}

enum JobType { INTERNSHIP, PART_TIME, FULL_TIME, FREELANCE }

extension JobTypeExtension on JobType {
  int get value {
    switch (this) {
      case JobType.INTERNSHIP:
        return 1;
      case JobType.PART_TIME:
        return 2;
      case JobType.FULL_TIME:
        return 3;
      case JobType.FREELANCE:
        return 4;
    }
  }

  static JobType? fromInt(int value) {
    switch (value) {
      case 1:
        return JobType.INTERNSHIP;
      case 2:
        return JobType.PART_TIME;
      case 3:
        return JobType.FULL_TIME;
      case 4:
        return JobType.FREELANCE;
    }
  }
}

enum JobExperience { JUNIOR, MID, SENIOR }

extension JobExperienceExtension on JobExperience {
  int get value {
    switch (this) {
      case JobExperience.JUNIOR:
        return 1;
      case JobExperience.MID:
        return 2;
      case JobExperience.SENIOR:
        return 3;
    }
  }

  static JobExperience? fromInt(int value) {
    switch (value) {
      case 1:
        return JobExperience.JUNIOR;
      case 2:
        return JobExperience.MID;
      case 3:
        return JobExperience.SENIOR;
    }
  }
}

enum JobEnvironment { ONSITE, REMOTE }

extension JobEnvironmentExtension on JobEnvironment {
  int get value {
    switch (this) {
      case JobEnvironment.REMOTE:
        return 1;
      case JobEnvironment.ONSITE:
        return 2;
    }
  }

  static JobEnvironment? fromInt(int value) {
    switch (value) {
      case 1:
        return JobEnvironment.REMOTE;
      case 2:
        return JobEnvironment.ONSITE;
    }
  }
}
