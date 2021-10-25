import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/elements/default_second_toolbar.dart';
import 'package:c2_antonio_hany/fragments/profile_page/menus/profile_page_left_menu.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_left_right_wrapper.dart';
import 'package:c2_antonio_hany/fragments/profile_page/menus/profile_page_right_panel.dart';
import 'package:c2_antonio_hany/jobook_master.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  int userId;

  ProfilePage({Key? key,required this.userId}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return JobookMaster(
        toolBar: JobookMaster.getToolbarForPage(context, ToolBarForPage.PROFILE),
        secondToolBarAlignment: MainAxisAlignment.spaceEvenly,
        content: DefaultSecondToolbar(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfilePageViewWrapper>(
                create: (context) => ProfilePageViewWrapper(),
              ),
              Provider<UserIdWrapper>(create: (_)=>UserIdWrapper(widget.userId))
            ],
            child: ProfilePageLeftRightWrapper(),
          ),
        ));
  }
}
