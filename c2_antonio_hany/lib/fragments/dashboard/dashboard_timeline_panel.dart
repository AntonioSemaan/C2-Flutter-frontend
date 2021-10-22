import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:flutter/widgets.dart';

class DashboardTimelinePanel extends StatefulWidget {
  const DashboardTimelinePanel({Key? key}) : super(key: key);

  @override
  _DashboardTimelinePanelState createState() => _DashboardTimelinePanelState();
}

class _DashboardTimelinePanelState extends State<DashboardTimelinePanel> {
  @override
  Widget build(BuildContext context) {
    return DashboardPanelWrapper(child: Container());
  }
}