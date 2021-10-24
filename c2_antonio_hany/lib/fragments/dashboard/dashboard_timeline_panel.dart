import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:c2_antonio_hany/fragments/dashboard/job_display_fragment.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DashboardTimelinePanel extends StatefulWidget {
  const DashboardTimelinePanel({Key? key}) : super(key: key);

  @override
  _DashboardTimelinePanelState createState() => _DashboardTimelinePanelState();
}

class _DashboardTimelinePanelState extends State<DashboardTimelinePanel> {
  @override
  Widget build(BuildContext context) {
    return DashboardPanelWrapper(
      hasMargin: true,
      hasBorder: false,
      child: FutureBuilder(
          future: MainApiRepo.jobApiRepo.fetchByEnum(
              context.watch<DashboardJobEnumWrapper>().value,
              context.read<SearchTextWrapper>().value,
              context.read<JobFiltersSorts>()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: " + snapshot.error.toString()),
              );
            } else if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              Map<String, dynamic>? responseData =
                  snapshot.data as Map<String, dynamic>;
              if (responseData == null ||
                  responseData.containsKey("errorMessage")) {
                String string = "Something went wrong, please try again";
                if (responseData != null) {
                  string = responseData["errorMessage"];
                }
                return Center(
                  child: Text(string),
                );
              } else if (!responseData["success"]) {
                return Center(
                  child: Text(responseData["message"]),
                );
              } else {
                List<Job> jobs = (responseData["data"] as List<dynamic>)
                    .map((e) => Job.fromJson(e))
                    .toList();
                if (jobs.isNotEmpty) {
                  return ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        return JobDisplayFragment(job: jobs[index]);
                      });
                } else {
                  return const Center(
                    child: Text("No jobs to show"),
                  );
                }
              }
            } else {
              return const Center(
                child: Text("Something went wrong while fetching jobs"),
              );
            }
          }),
    );
  }
}
