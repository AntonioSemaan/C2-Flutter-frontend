import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:flutter/widgets.dart';

class SkillsFragment extends StatefulWidget {
  SkillsFragment({Key? key}) : super(key: key);

  @override
  _SkillsFragmentState createState() => _SkillsFragmentState();
}

class _SkillsFragmentState extends State<SkillsFragment> {
  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(child: SingleChildScrollView());
  }
}
