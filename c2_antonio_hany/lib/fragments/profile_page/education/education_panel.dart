import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_education.dart';
import 'package:c2_antonio_hany/fragments/profile_page/education/education_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/wrappers/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EducationPanel extends StatefulWidget {
  EducationPanel({Key? key}) : super(key: key);

  @override
  _EducationPanelState createState() => _EducationPanelState();
}

class _EducationPanelState extends State<EducationPanel> {
  late bool inEditMode;

  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;

    return FutureBuilder(
      future: MainApiRepo.profileApiRepo
          .getUserEducation(context.read<UserIdWrapper>().value),
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
            context.read<EducationListWrapper>().initValue =
                (responseData["data"] as List<dynamic>)
                    .map((e) => UserEducation.fromJson(e))
                    .toList();

            return ProfilePagePanelWrapper(
                child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          context.watch<EducationListWrapper>().value.length,
                      itemBuilder: (context, index) {
                        return EducationFragment(index: index);
                      }),
                ),
                Visibility(
                  visible: inEditMode &&
                      context.read<EducationListWrapper>().value.isNotEmpty,
                  child: TextButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(90, 40)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(0, 133, 254, 1.0)))),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(0, 133, 254, 1.0)),
                        textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.headline4),
                      ),
                      onPressed: () async {
                        Map<String, dynamic>? responseData = await MainApiRepo
                            .profileApiRepo
                            .updateUserEducation(gLoggedUser!.userId,
                                context.read<EducationListWrapper>().value);
                        String stringToShow = "";
                        if (responseData == null ||
                            responseData.containsKey("errorMessage")) {
                          stringToShow =
                              "Something went wrong, please try again";
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
                          stringToShow = "Education is successfully saved.";
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(stringToShow,
                                style: Theme.of(context).textTheme.headline4),
                            backgroundColor:
                                const Color.fromRGBO(0, 133, 254, 1.0),
                          ));
                        }
                      },
                      child: const Text("Update")),
                )
              ],
            ));
          }
        } else {
          return const Center(
            child: Text("Something went wrong while retreiving the education"),
          );
        }
      },
    );
  }
}
