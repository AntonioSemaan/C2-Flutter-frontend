import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/fragments/elements/floating_delete_icon_button.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:c2_antonio_hany/enums.dart';

import '../../../managers/main_api_repo.dart';

class PostFragment extends StatefulWidget {
  int index;

  PostFragment({Key? key, required this.index}) : super(key: key);

  @override
  _PostFragmentState createState() => _PostFragmentState();
}

class _PostFragmentState extends State<PostFragment> {
  late bool inEditMode;
  String? _comment = "";
  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;
    return ProfilePageFragmentWrapper(
        desiredHeight: 655,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              inEditMode
                  ? FloatingDeleteIconButton(onPressed: () async {
                      Map<String, dynamic>? responseData =
                          await MainApiRepo.jobApiRepo.delete(context
                              .read<JobsListWrapper>()
                              .value[widget.index]);
                      String stringToShow = "";
                      if (responseData == null ||
                          responseData.containsKey("errorMessage")) {
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
                        stringToShow = "Job deleted successfully.";
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(stringToShow,
                              style: Theme.of(context).textTheme.headline4),
                          backgroundColor:
                              const Color.fromRGBO(0, 133, 254, 1.0),
                        ));
                        context.read<ProfilePageViewWrapper>().value =
                            context.read<ProfilePageViewWrapper>().value;
                      }
                    })
                  : const SizedBox(width: 10, height: 10),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          context
                              .read<JobsListWrapper>()
                              .value[widget.index]
                              .jobEnum!
                              .stringValue,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          right: 25.0,
                          left: 25.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Posted By:"),
                            Text(
                                context
                                    .read<JobsListWrapper>()
                                    .value[widget.index]
                                    .user!
                                    .fullname,
                                style: const TextStyle(
                                    color: Color.fromRGBO(0, 133, 254, 1.0))),
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
                            Text(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .title!)
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
                            Text(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .jobType!
                                .stringValue)
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
                            Text(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .jobExperience!
                                .stringValue)
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
                            Text(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .jobEnvironment!
                                .stringValue)
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
                                Text(context
                                    .read<JobsListWrapper>()
                                    .value[widget.index]
                                    .salaryFrom!
                                    .toString())
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Salary to:"),
                                Text(context
                                    .read<JobsListWrapper>()
                                    .value[widget.index]
                                    .salaryTo!
                                    .toString())
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
                            Text(gNormalFormat.format(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .deadline!))
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
                            Text(gNormalFormat.format(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .creationDate!))
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
                            Text(context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .description!)
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
                        child: context
                                .read<JobsListWrapper>()
                                .value[widget.index]
                                .comments!
                                .isNotEmpty
                            ? ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Text(context
                                          .read<JobsListWrapper>()
                                          .value[widget.index]
                                          .comments![index]
                                          .user
                                          .fullname),
                                      subtitle: Text(context
                                          .read<JobsListWrapper>()
                                          .value[widget.index]
                                          .comments![index]
                                          .content),
                                      trailing: inEditMode
                                          ? IconButton(
                                              onPressed: () async {
                                                Map<String, dynamic>?
                                                    responseData =
                                                    await MainApiRepo
                                                        .commentApiRepo
                                                        .deleteComment(context
                                                            .read<
                                                                JobsListWrapper>()
                                                            .value[widget.index]
                                                            .comments![index]
                                                            .id!);
                                                String stringToShow = "";
                                                if (responseData == null ||
                                                    responseData.containsKey(
                                                        "errorMessage")) {
                                                  stringToShow =
                                                      "Something went wrong, please try again";
                                                  if (responseData != null) {
                                                    stringToShow = responseData[
                                                        "errorMessage"];
                                                  }
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(stringToShow),
                                                    backgroundColor: Colors.red,
                                                  ));
                                                } else if (!responseData[
                                                    "success"]) {
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
                                                          .read<
                                                              ProfilePageViewWrapper>()
                                                          .value =
                                                      context
                                                          .read<
                                                              ProfilePageViewWrapper>()
                                                          .value;
                                                }
                                              },
                                              icon: const Icon(Icons.cancel,
                                                  color: Colors.red))
                                          : const SizedBox(
                                              height: 10, width: 10));
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: context
                                    .read<JobsListWrapper>()
                                    .value[widget.index]
                                    .comments!
                                    .length)
                            : const Center(child: Text("No comments to show")),
                      ),
                      TextField(
                          decoration: const InputDecoration(
                              hintText: "Write Comment",
                              label: Text("Comment")),
                          onChanged: (value) {
                            _comment = value;
                          },
                          onSubmitted: (value) {
                            if (_comment!.isNotEmpty) {
                              callSendComment();
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
              ),
            ],
          ),
        ));
  }

  callSendComment() async {
    Map<String, dynamic>? responseData = await MainApiRepo.commentApiRepo
        .addComment(gLoggedUser!.userId,
            context.read<JobsListWrapper>().value[widget.index].id!, _comment!);
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
      context.read<ProfilePageViewWrapper>().value =
          context.read<ProfilePageViewWrapper>().value;
    }
  }
}
