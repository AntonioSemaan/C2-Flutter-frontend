import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/profile_page/education/new_education_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/experience/new_experience_fragment.dart';
import 'package:c2_antonio_hany/fragments/profile_page/posts/new_post_fragment.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/pages/chat_welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePageLeftMenu extends StatefulWidget {
  ProfilePageView pageView;
  ProfilePageLeftMenu({Key? key, required this.pageView}) : super(key: key);

  @override
  _ProfilePageLeftMenuState createState() => _ProfilePageLeftMenuState();
}

class _ProfilePageLeftMenuState extends State<ProfilePageLeftMenu> {
  Map<ProfilePageView, String> panelsMap = {
    ProfilePageView.PERSONAL_INFO: "Personal Information",
    ProfilePageView.POSTS: "Posts",
    ProfilePageView.EDUCATION: "Education",
    ProfilePageView.EXPERIENCE: "Experience",
    ProfilePageView.SKILLS: "Skills",
    ProfilePageView.NEW: "NEW",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == panelsMap.length - 1) {
              if (context.read<UserIdWrapper>().value == gLoggedUser!.userId) {
                return Center(
                  heightFactor: 2,
                  child: FloatingActionButton.large(
                      child: const Icon(Icons.add),
                      backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                      onPressed: context.read<ProfilePageViewWrapper>().value ==
                                  ProfilePageView.PERSONAL_INFO ||
                              context.read<ProfilePageViewWrapper>().value ==
                                  ProfilePageView.SKILLS
                          ? null
                          : () async {
                              AlertDialog? toShow;
                              if (context
                                      .read<ProfilePageViewWrapper>()
                                      .value ==
                                  ProfilePageView.POSTS) {
                                toShow = AlertDialog(
                                  title: const Center(child: Text("New Post")),
                                  content: SizedBox(
                                      height: 600,
                                      width: 700,
                                      child: NewPostFragment()),
                                );
                              } else if (context
                                      .read<ProfilePageViewWrapper>()
                                      .value ==
                                  ProfilePageView.EDUCATION) {
                                toShow = AlertDialog(
                                  title: const Center(
                                      child: Text("New Education")),
                                  content: SizedBox(
                                      height: 480,
                                      width: 700,
                                      child: NewEducationFragment()),
                                );
                              } else if (context
                                      .read<ProfilePageViewWrapper>()
                                      .value ==
                                  ProfilePageView.EXPERIENCE) {
                                toShow = AlertDialog(
                                  title: const Center(
                                      child: Text("New Experience")),
                                  content: SizedBox(
                                      height: 480,
                                      width: 700,
                                      child: NewExperienceFragment()),
                                );
                              }
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return toShow!;
                                  });
                              context.read<ProfilePageViewWrapper>().value =
                                  context.read<ProfilePageViewWrapper>().value;
                            }),
                );
              } else {
                return Center(
                  heightFactor: 2,
                  child: FloatingActionButton.large(
                      child: const Text("Chat"),
                      backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                      onPressed: () async {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ChatWelcomeScreen();
                        }));
                      }),
                );
              }
            } else {
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
            }
          },
          itemCount: panelsMap.length),
    );
  }
}
