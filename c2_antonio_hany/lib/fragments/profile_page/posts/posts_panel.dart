import 'package:c2_antonio_hany/data_classes/job.dart';
import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/fragments/profile_page/posts/post_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PostsPanel extends StatefulWidget {
  PostsPanel({Key? key}) : super(key: key);

  @override
  _PostsPanelState createState() => _PostsPanelState();
}

class _PostsPanelState extends State<PostsPanel> {
  late bool inEditMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JobsListWrapper>(
            create: (_) => JobsListWrapper())
      ],
      child: FutureBuilder(
          future: MainApiRepo.jobApiRepo
              .fetchByUser(context.read<UserIdWrapper>().value),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: " + snapshot.error!.toString()),
              );
            } else if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
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
                context.read<JobsListWrapper>().value =
                    (responseData["data"] as List<dynamic>)
                        .map((e) => Job.fromJson(e))
                        .toList();
                if (context.read<JobsListWrapper>().value.isNotEmpty) {
                  return ProfilePagePanelWrapper(
                      child: Expanded(
                    child: ListView.builder(
                      itemCount: context.watch<JobsListWrapper>().value.length,
                      itemBuilder: (context, index) {
                        return PostFragment(index: index);
                      },
                    ),
                  ));
                } else {
                  return const Center(
                    child: Text("No jobs to show"),
                  );
                }
              }
            } else {
              return const Center(
                child: Text(
                    "Something went wrong while retreiving the experiences"),
              );
            }
          }),
    );
  }
}
