import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class JobDisplayFragment extends StatefulWidget {
  Job job;

  JobDisplayFragment({Key? key, required this.job}) : super(key: key);

  @override
  _JobDisplayFragmentState createState() => _JobDisplayFragmentState();
}

class _JobDisplayFragmentState extends State<JobDisplayFragment> {
  @override
  Widget build(BuildContext context) {
    return DashboardPanelWrapper(
        hasMargin: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    context.read<DashboardJobEnumWrapper>().value == JobEnum.ALL
                        ? Center(
                            child: Text(
                              widget.job.jobEnum!.stringValue,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Posted By:"),
                          Text(widget.job.user!.fullname)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Title:"),
                          Text(widget.job.title!)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Job Type:"),
                          Text(widget.job.jobType!.stringValue)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Experience:"),
                          Text(widget.job.jobExperience!.stringValue)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Work environment:"),
                          Text(widget.job.jobEnvironment!.stringValue)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("Salary from:"),
                              Text(widget.job.salaryFrom!.toString())
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Salary to:"),
                              Text(widget.job.salaryTo!.toString())
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Deadline:"),
                          Text(gNormalFormat.format(widget.job.deadline!))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Created on:"),
                          Text(gNormalFormat.format(widget.job.creationDate!))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Description:"),
                          Text(widget.job.description!)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ));
  }
}
