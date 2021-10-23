import 'package:c2_antonio_hany/data_classes/job_filters.dart';
import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/data_classes/job_sorts.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_filter_panel.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_timeline_panel.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashborad_sorting_panel.dart';
import 'package:c2_antonio_hany/fragments/elements/default_second_toolbar.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/master.dart';
import 'package:c2_antonio_hany/pages/contact_us.dart';
import 'package:c2_antonio_hany/pages/home_page.dart';
import 'package:c2_antonio_hany/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Master(
      title: "Welcome, " + gLoggedUser!.fullname + " !",
      content: DefaultSecondToolbar(
        child: MultiProvider(
          providers: [
            Provider<JobFiltersSorts>(
                create: (_) => JobFiltersSorts(
                    jobFilters: JobFilters(), jobSorts: JobSorts()))
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(flex: 2, child: DashBoardSortingPanel()),
              Expanded(flex: 6, child: DashboardTimelinePanel()),
              Expanded(flex: 2, child: DashboardFilterPanel()),
            ],
          ),
        ),
      ),
      hasSearchField: true,
      toolBar: Master.getToolbarForPage(context, ToolBarForPage.DASHBOARD),
      secondToolBarAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
