import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/default_second_toolbar.dart';
import 'package:c2_antonio_hany/fragments/profile_page/profile_page_left_menu.dart';
import 'package:c2_antonio_hany/fragments/profile_page/profile_page_right_panel.dart';
import 'package:c2_antonio_hany/master.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Master(
        hasSearchField: true,
        toolBar: Master.getToolbarForPage(context, ToolBarForPage.PROFILE),
        secondToolBarAlignment: MainAxisAlignment.spaceEvenly,
        content: DefaultSecondToolbar(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfilePageViewWrapper>(
                create: (context) => ProfilePageViewWrapper(),
              )
            ],
            child: Row(
              children: [
                Expanded(flex: 2, child: ProfilePageLeftMenu()),
                Expanded(flex: 8, child: ProfilePageRightPanel()),
              ],
            ),
          ),
        ));
  }
}
