import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/dashboard/dashboard_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:c2_antonio_hany/pages/profile_page.dart';
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
  String? _comment = "";
  late bool inEditMode;

  @override
  Widget build(BuildContext context) {
    inEditMode = widget.job.user!.userId == gLoggedUser!.userId;
    return DashboardPanelWrapper(
        hasMargin: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 600,
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProfilePage(userId: widget.job.user!.userId);
                          }));
                        },
                        child: Text(widget.job.user!.fullname,
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 133, 254, 1.0))),
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
                    children: [const Text("Title:"), Text(widget.job.title!)],
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
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(0, 133, 254, 1.0))),
                  constraints: const BoxConstraints(maxHeight: 130),
                  child: widget.job.comments!.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(widget.job.comments![index].user.fullname),
                                subtitle:
                                    Text(widget.job.comments![index].content),
                                trailing: inEditMode
                                    ? IconButton(
                                        onPressed: () async {
                                          Map<String, dynamic>? responseData =
                                              await MainApiRepo.commentApiRepo
                                                  .deleteComment(widget.job
                                                      .comments![index].id!);
                                          String stringToShow = "";
                                          if (responseData == null ||
                                              responseData.containsKey(
                                                  "errorMessage")) {
                                            stringToShow =
                                                "Something went wrong, please try again";
                                            if (responseData != null) {
                                              stringToShow =
                                                  responseData["errorMessage"];
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(stringToShow),
                                              backgroundColor: Colors.red,
                                            ));
                                          } else if (!responseData["success"]) {
                                            stringToShow =
                                                responseData["message"];
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(stringToShow),
                                              backgroundColor: Colors.red,
                                            ));
                                          } else {
                                            stringToShow =
                                                "Comment deleted successfully.";
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(stringToShow,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4),
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      0, 133, 254, 1.0),
                                            ));
                                            context
                                                    .read<ProfilePageViewWrapper>()
                                                    .value =
                                                context
                                                    .read<
                                                        ProfilePageViewWrapper>()
                                                    .value;
                                          }
                                        },
                                        icon: const Icon(Icons.cancel,
                                            color: Colors.red))
                                    : const SizedBox(height: 10, width: 10));
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: widget.job.comments!.length)
                      : const Center(child: Text("No comments to show")),
                ),
                TextField(
                    decoration: const InputDecoration(
                        hintText: "Write Comment", label: Text("Comment")),
                    onChanged: (value) {
                      _comment = value;
                    },
                    onSubmitted: (value) {
                      if (_comment!.isNotEmpty) {
                        callSendComment(widget.job);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("The comment cannot be empty"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    })
              ],
            ),
          ),
        ));
  }

  callSendComment(Job job) async {
    Map<String, dynamic>? responseData = await MainApiRepo.commentApiRepo
        .addComment(gLoggedUser!.userId, job.id!, _comment!);
    String stringToShow = "";
    if (responseData == null || responseData.containsKey("errorMessage")) {
      stringToShow = "Something went wrong, please try again";
      if (responseData != null) {
        stringToShow = responseData["errorMessage"];
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(stringToShow),
        backgroundColor: Colors.red,
      ));
    } else if (!responseData["success"]) {
      stringToShow = responseData["message"];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(stringToShow),
        backgroundColor: Colors.red,
      ));
    } else {
      stringToShow = "Comment saved successfully.";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(stringToShow, style: Theme.of(context).textTheme.headline4),
        backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
      ));
      context.watch<DashboardJobEnumWrapper>().value =
          context.watch<DashboardJobEnumWrapper>().value;
    }
  }
}
