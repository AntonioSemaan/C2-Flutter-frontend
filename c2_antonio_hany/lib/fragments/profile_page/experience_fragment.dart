import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:flutter/widgets.dart';

class ExperienceFragment extends StatefulWidget {
  ExperienceFragment({Key? key}) : super(key: key);

  @override
  _ExperienceFragmentState createState() => _ExperienceFragmentState();
}

class _ExperienceFragmentState extends State<ExperienceFragment> {
  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(child: SingleChildScrollView());
  }
}