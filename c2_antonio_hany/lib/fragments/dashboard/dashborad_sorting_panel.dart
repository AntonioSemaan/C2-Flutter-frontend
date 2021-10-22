import 'package:c2_antonio_hany/data_classes/job_filters_sorts.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardSortingPanel extends StatefulWidget {
  const DashBoardSortingPanel({Key? key}) : super(key: key);

  @override
  _DashBoardSortingPanelState createState() => _DashBoardSortingPanelState();
}

class _DashBoardSortingPanelState extends State<DashBoardSortingPanel> {
  String currentByDate = "newest";
  String currentByName = "ascending";

  @override
  Widget build(BuildContext context) {
    return DashboardPanelWrapper(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Visibility(
              visible: context.read<JobFiltersSorts>().anySortsIsNotDefault(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        context.read<JobFiltersSorts>().resetFiltersAndSorts();
                        context.read<DashboardJobEnumWrapper>().value =
                            context.read<DashboardJobEnumWrapper>().value;
                      });
                    },
                    child: Text("Clear",
                        style: Theme.of(context).textTheme.headline4),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red[600]),
                      fixedSize: MaterialStateProperty.all(const Size(30, 18)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.red))),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.headline4),
                    )),
              ),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Sort",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Expanded(
                child: Visibility(
              visible: context.read<JobFiltersSorts>().anySortsIsNotDefault(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        context.read<DashboardJobEnumWrapper>().value =
                            context.read<DashboardJobEnumWrapper>().value;
                      });
                    },
                    child: Text("Apply",
                        style: Theme.of(context).textTheme.headline4),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromRGBO(0, 110, 220, 1.0)),
                      fixedSize: MaterialStateProperty.all(const Size(30, 18)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                  color: Color.fromRGBO(0, 133, 254, 1.0)))),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(0, 133, 254, 1.0)),
                      textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.headline4),
                    )),
              ),
            )),
          ],
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text(
                "By Date",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Column(
              children: [
                RadioListTile<String>(
                    title: const Text("Newest"),
                    value: "newest",
                    groupValue: currentByDate,
                    onChanged: (value) {
                      setState(() {
                        currentByDate = value!;
                        if (value == "newest") {
                          context.read<JobFiltersSorts>().jobSorts.newestDate =
                              true;
                          context.read<JobFiltersSorts>().jobSorts.oldestDate =
                              false;
                        } else {
                          context.read<JobFiltersSorts>().jobSorts.newestDate =
                              false;
                          context.read<JobFiltersSorts>().jobSorts.oldestDate =
                              true;
                        }
                      });
                    }),
                RadioListTile<String>(
                    title: const Text("Oldest"),
                    value: "oldest",
                    groupValue: currentByDate,
                    onChanged: (value) {
                      setState(() {
                        currentByDate = value!;
                        if (value == "newest") {
                          context.read<JobFiltersSorts>().jobSorts.newestDate =
                              true;
                          context.read<JobFiltersSorts>().jobSorts.oldestDate =
                              false;
                        } else {
                          context.read<JobFiltersSorts>().jobSorts.newestDate =
                              false;
                          context.read<JobFiltersSorts>().jobSorts.oldestDate =
                              true;
                        }
                      });
                    })
              ],
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Text(
                "By Name",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Column(
              children: [
                RadioListTile<String>(
                    title: const Text("Ascending"),
                    value: "ascending",
                    groupValue: currentByName,
                    onChanged: (value) {
                      setState(() {
                        currentByName = value!;
                        if (value == "ascending") {
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameAscending = true;
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameDescending = false;
                        } else {
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameAscending = false;
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameDescending = true;
                        }
                      });
                    }),
                RadioListTile<String>(
                    title: const Text("Descending"),
                    value: "descending",
                    groupValue: currentByName,
                    onChanged: (value) {
                      setState(() {
                        currentByName = value!;
                        if (value == "ascending") {
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameAscending = true;
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameDescending = false;
                        } else {
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameAscending = false;
                          context
                              .read<JobFiltersSorts>()
                              .jobSorts
                              .nameDescending = true;
                        }
                      });
                    })
              ],
            ),
          ],
        )
      ],
    ));
  }
}
