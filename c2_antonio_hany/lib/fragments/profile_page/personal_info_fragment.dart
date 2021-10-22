import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:flutter/widgets.dart';

class PersonalInfoFragment extends StatefulWidget {
  PersonalInfoFragment({Key? key}) : super(key: key);

  @override
  _PersonalInfoFragmentState createState() => _PersonalInfoFragmentState();
}

class _PersonalInfoFragmentState extends State<PersonalInfoFragment> {
  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(child: SingleChildScrollView());
  }
}
