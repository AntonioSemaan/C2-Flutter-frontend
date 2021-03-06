import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/profile_page/menus/profile_page_left_menu.dart';
import 'package:c2_antonio_hany/fragments/profile_page/menus/profile_page_right_panel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePageLeftRightWrapper extends StatefulWidget {
  ProfilePageLeftRightWrapper({Key? key}) : super(key: key);

  @override
  _ProfilePageLeftRightWrapperState createState() =>
      _ProfilePageLeftRightWrapperState();
}

class _ProfilePageLeftRightWrapperState
    extends State<ProfilePageLeftRightWrapper> {
  @override
  Widget build(BuildContext context) {
    ProfilePageView pageView = context.watch<ProfilePageViewWrapper>().value;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EducationListWrapper>(
          create: (_) => EducationListWrapper(),
        ),
        ChangeNotifierProvider<ExperienceListWrapper>(
            create: (_) => ExperienceListWrapper())
      ],
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: ProfilePageLeftMenu(
                pageView: pageView,
              )),
          Expanded(
              flex: 8,
              child: ProfilePageRightPanel(
                pageView: pageView,
              )),
        ],
      ),
    );
  }
}
