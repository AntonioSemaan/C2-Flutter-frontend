import 'package:c2_antonio_hany/fragments/profile_page/profile_page_fragment_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SkillsFragment extends StatefulWidget {
  List<String> skills;

  SkillsFragment({Key? key, required this.skills}) : super(key: key);

  @override
  _SkillsFragmentState createState() => _SkillsFragmentState();
}

class _SkillsFragmentState extends State<SkillsFragment> {
  String currentSkill = "";
  String currentlyEditing = "";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProfilePageFragmentWrapper(
        child: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
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

                setState(() {
                  if (currentlyEditing != "") {
                    widget.skills[widget.skills.indexOf(currentlyEditing)] =
                        currentSkill;
                  } else {
                    widget.skills.add(currentSkill);
                  }
                  currentlyEditing = "";
                  currentSkill = "";
                  _controller.text = "";
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: Expanded(
              child: Wrap(
                children: widget.skills
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(e),
                            onDeleted: () {
                              setState(() {
                                widget.skills.remove(e);
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        TextButton(
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
            onPressed: () {
              
            },
            child: const Text("Save"))
      ],
    ));
  }
}
