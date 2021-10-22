import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:flutter/widgets.dart';

class EducationFragment extends StatefulWidget {
  EducationFragment({Key? key}) : super(key: key);

  @override
  _EducationFragmentState createState() => _EducationFragmentState();
}

class _EducationFragmentState extends State<EducationFragment> {
  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(child: SingleChildScrollView());
  }
}