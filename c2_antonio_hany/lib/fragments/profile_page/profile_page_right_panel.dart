import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/profile_page/education_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/experience_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/personal_info_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/skills_fragment.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePageRightPanel extends StatefulWidget {
  ProfilePageRightPanel({Key? key}) : super(key: key);

  @override
  _ProfilePageRightPanelState createState() => _ProfilePageRightPanelState();
}

class _ProfilePageRightPanelState extends State<ProfilePageRightPanel> {
  @override
  Widget build(BuildContext context) {
    switch (context.watch<ProfilePageViewWrapper>().value) {
      case ProfilePageView.PERSONAL_INFO:
        return PersonalInfoFragment();
      case ProfilePageView.EDUCATION:
        return EducationFragment();
      case ProfilePageView.EXPERIENCE:
        return ExperienceFragment();
      case ProfilePageView.SKILLS:
        return SkillsFragment();
      default:
        return Container();
    }
  }
}
