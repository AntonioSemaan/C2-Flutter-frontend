import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardFilterPanel extends StatefulWidget {
  const DashboardFilterPanel({Key? key}) : super(key: key);

  @override
  _DashboardFilterPanelState createState() => _DashboardFilterPanelState();
}

class _DashboardFilterPanelState extends State<DashboardFilterPanel> {
  JobExperience? currExperience;
  JobEnvironment? currEnvironment;
  JobType? currType;

  @override
  Widget build(BuildContext context) {
    return DashboardPanelWrapper(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Visibility(
              visible: currType != null ||
                  currEnvironment != null ||
                  currExperience != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        currType = currEnvironment = currExperience = null;
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Filter",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Expanded(
                child: Visibility(
              visible: currType != null ||
                  currEnvironment != null ||
                  currExperience != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        currType = currEnvironment = currExperience = null;
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
            ))
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: Text(
                      "Experience",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile<JobExperience>(
                          title: const Text("Junior"),
                          value: JobExperience.JUNIOR,
                          groupValue: currExperience,
                          onChanged: (value) {
                            setState(() {
                              currExperience = value!;
                            });
                          }),
                      RadioListTile<JobExperience>(
                          title: const Text("Mid"),
                          value: JobExperience.MID,
                          groupValue: currExperience,
                          onChanged: (value) {
                            setState(() {
                              currExperience = value!;
                            });
                          }),
                      RadioListTile<JobExperience>(
                          title: const Text("Senior"),
                          value: JobExperience.SENIOR,
                          groupValue: currExperience,
                          onChanged: (value) {
                            setState(() {
                              currExperience = value!;
                            });
                          }),
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
                      "Environment",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile<JobEnvironment>(
                          title: const Text("On Site"),
                          value: JobEnvironment.ONSITE,
                          groupValue: currEnvironment,
                          onChanged: (value) {
                            setState(() {
                              currEnvironment = value!;
                            });
                          }),
                      RadioListTile<JobEnvironment>(
                          title: const Text("Remote"),
                          value: JobEnvironment.REMOTE,
                          groupValue: currEnvironment,
                          onChanged: (value) {
                            setState(() {
                              currEnvironment = value!;
                            });
                          }),
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
                      "Type",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Column(
                    children: [
                      RadioListTile<JobType>(
                          title: const Text("Internship"),
                          value: JobType.INTERNSHIP,
                          groupValue: currType,
                          onChanged: (value) {
                            setState(() {
                              currType = value!;
                            });
                          }),
                      RadioListTile<JobType>(
                          title: const Text("Part-Time"),
                          value: JobType.PART_TIME,
                          groupValue: currType,
                          onChanged: (value) {
                            setState(() {
                              currType = value!;
                            });
                          }),
                      RadioListTile<JobType>(
                          title: const Text("Full-Time"),
                          value: JobType.FULL_TIME,
                          groupValue: currType,
                          onChanged: (value) {
                            setState(() {
                              currType = value!;
                            });
                          }),
                      RadioListTile<JobType>(
                          title: const Text("Freelance"),
                          value: JobType.FREELANCE,
                          groupValue: currType,
                          onChanged: (value) {
                            setState(() {
                              currType = value!;
                            });
                          }),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
