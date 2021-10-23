import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/data_classes/user_skill.dart';
import 'package:c2_antonio_hany/fragments/profile_page/profile_page_panel_wrapper.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SkillsFragment extends StatefulWidget {
  late List<UserSkill> userSkills;

  SkillsFragment({Key? key, required this.userSkills}) : super(key: key);

  @override
  _SkillsFragmentState createState() => _SkillsFragmentState();
}

class _SkillsFragmentState extends State<SkillsFragment> {
  String currentSkill = "";
  String currentlyEditing = "";
  final TextEditingController _controller = TextEditingController();
  late List<String?> skills;
  late bool inEditMode;

  @override
  void initState() {
    skills = widget.userSkills.map((e) => e.name).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inEditMode = context.read<UserIdWrapper>().value == gLoggedUser!.userId;

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              enabled: inEditMode,
              controller: _controller,
              style: Theme.of(context).textTheme.headline4,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  label: Text(
                    "Skill",
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Insert Skill",
                  hintStyle: TextStyle(color: Colors.white),
                  focusColor: Colors.white),
              onChanged: (value) {
                currentSkill = value;
              },
              onSubmitted: (value) {
                currentSkill = value;

                if (mounted) {
                  setState(() {
                    if (currentlyEditing != "") {
                      skills[skills.indexOf(currentlyEditing)] = currentSkill;
                    } else {
                      skills.add(currentSkill);
                    }
                    currentlyEditing = "";
                    currentSkill = "";
                    _controller.text = "";
                  });
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: Expanded(
              child: Wrap(
                children: skills
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(e!),
                            onDeleted: () {
                              if (mounted) {
                                setState(() {
                                  skills.remove(e);
                                });
                              }
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: inEditMode,
          child: TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(70, 40)),
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
              ),
              onPressed: () async {
                List<UserSkill> userSkills =
                    skills.map((e) => UserSkill(e)).toList();
                Map<String, dynamic>? responseData = await MainApiRepo
                    .profileApiRepo
                    .updateUserSkills(gLoggedUser!.userId, userSkills);
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
                  stringToShow = "Skill are successfully saved.";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(stringToShow,
                        style: Theme.of(context).textTheme.headline4),
                    backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                  ));
                }
              },
              child: const Text("Save")),
        )
      ],
    );
  }
}
