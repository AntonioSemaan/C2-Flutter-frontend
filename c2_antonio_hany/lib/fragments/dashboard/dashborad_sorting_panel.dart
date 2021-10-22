import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Sort",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
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
                      });
                    }),
                RadioListTile<String>(
                    title: const Text("Oldest"),
                    value: "oldest",
                    groupValue: currentByDate,
                    onChanged: (value) {
                      setState(() {
                        currentByDate = value!;
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
                        currentByDate = value!;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text("Descending"),
                    value: "descending",
                    groupValue: currentByName,
                    onChanged: (value) {
                      setState(() {
                        currentByDate = value!;
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
