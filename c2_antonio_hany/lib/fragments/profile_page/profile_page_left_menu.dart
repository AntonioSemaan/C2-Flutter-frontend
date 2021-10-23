import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePageLeftMenu extends StatefulWidget {
  ProfilePageView pageView;
  ProfilePageLeftMenu({Key? key,required this.pageView}) : super(key: key);

  @override
  _ProfilePageLeftMenuState createState() => _ProfilePageLeftMenuState();
}

class _ProfilePageLeftMenuState extends State<ProfilePageLeftMenu> {
  Map<ProfilePageView, String> panelsMap = {
    ProfilePageView.PERSONAL_INFO: "Personal Information",
    ProfilePageView.EDUCATION: "Education",
    ProfilePageView.EXPERIENCE: "Experience",
    ProfilePageView.SKILLS: "Skills"
  };

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                        color: Color.fromRGBO(0, 133, 254, 1.0))),
                tileColor: Colors.white,
                selectedTileColor: const Color.fromRGBO(0, 133, 254, 1.0),
                selected:
                    panelsMap.entries.elementAt(index).key == widget.pageView,
                title: Text(
                  panelsMap.entries.elementAt(index).value,
                  style: TextStyle(
                      color: panelsMap.entries.elementAt(index).key ==
                              widget.pageView
                          ? Colors.white
                          : const Color.fromRGBO(0, 133, 254, 1.0)),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  context.read<ProfilePageViewWrapper>().value =
                      panelsMap.entries.elementAt(index).key;
                },
              ),
            );
          },
          itemCount: panelsMap.length),
    );
  }
}
