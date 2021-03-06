import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/profile_page/education/education_panel.dart';
import 'package:c2_antonio_hany/fragments/profile_page/experience/experience_panel.dart';
import 'package:c2_antonio_hany/fragments/profile_page/personal_information/personal_info_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/personal_information/personal_info_panel.dart';
import 'package:c2_antonio_hany/fragments/profile_page/posts/posts_panel.dart';
import 'package:c2_antonio_hany/fragments/profile_page/skills/skills_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/skills/skills_panel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePageRightPanel extends StatefulWidget {
  ProfilePageView pageView;
  ProfilePageRightPanel({Key? key, required this.pageView}) : super(key: key);

  @override
  _ProfilePageRightPanelState createState() => _ProfilePageRightPanelState();
}

class _ProfilePageRightPanelState extends State<ProfilePageRightPanel> {
  @override
  Widget build(BuildContext context) {
    switch (widget.pageView) {
      case ProfilePageView.PERSONAL_INFO:
        return PersonalInfoPanel();
      case ProfilePageView.POSTS:
        return PostsPanel();
      case ProfilePageView.EDUCATION:
        return EducationPanel();
      case ProfilePageView.EXPERIENCE:
        return ExperiencePanel();
      case ProfilePageView.SKILLS:
        return SkillsPanel();
      default:
        return Container();
    }
  }
}
