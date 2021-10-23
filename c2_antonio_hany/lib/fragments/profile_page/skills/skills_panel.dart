import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_skill.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/fragments/profile_page/skills/skills_fragment.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SkillsPanel extends StatefulWidget {
  SkillsPanel({
    Key? key,
  }) : super(key: key);

  @override
  _SkillsPanelState createState() => _SkillsPanelState();
}

class _SkillsPanelState extends State<SkillsPanel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MainApiRepo.profileApiRepo
            .getUserSkills(context.read<UserIdWrapper>().value),
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
              List<UserSkill> userSkills =
                  (responseData["data"] as List<dynamic>)
                      .map((e) => UserSkill.fromJson(e))
                      .toList();
              return ProfilePagePanelWrapper(
                  child: SkillsFragment(userSkills: userSkills));
            }
          } else {
            return const Center(
              child: Text("SomethingwentWrong while retreiving the skills"),
            );
          }
        });
  }
}
