import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/fragments/profile_page/personal_information/personal_info_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PersonalInfoPanel extends StatefulWidget {
  PersonalInfoPanel({Key? key}) : super(key: key);

  @override
  _PersonalInfoPanelState createState() => _PersonalInfoPanelState();
}

class _PersonalInfoPanelState extends State<PersonalInfoPanel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MainApiRepo.userApiRepo
            .fetchUser(context.read<UserIdWrapper>().value),
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
              User user = User.fromJson(responseData["data"]);
              return ProfilePagePanelWrapper(
                  child: PersonalInfoFragment(user: user));
            }
          } else {
            return const Center(
              child:
                  Text("Something went wrong while retreiving the experiences"),
            );
          }
        });
  }
}
