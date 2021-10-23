import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/fragments/elements/floating_delete_icon_button.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_fragment_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:c2_antonio_hany/enums.dart';

class PostFragment extends StatefulWidget {
  int index;

  PostFragment({Key? key, required this.index}) : super(key: key);

  @override
  _PostFragmentState createState() => _PostFragmentState();
}

class _PostFragmentState extends State<PostFragment> {
  late bool inEditMode;
  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;
    return ProfilePageFragmentWrapper(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          inEditMode
              ? FloatingDeleteIconButton(onPressed: () {
                  context.read<JobsListWrapper>().value.removeAt(widget.index);
                })
              : Container(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
