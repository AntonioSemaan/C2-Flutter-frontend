import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/pages/chat_welcome_screen.dart';
import 'package:c2_antonio_hany/pages/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultSecondToolbar extends StatefulWidget {
  Widget child;

  DefaultSecondToolbar({Key? key, required this.child}) : super(key: key);

  @override
  _DefaultSecondToolbarState createState() => _DefaultSecondToolbarState();
}

class _DefaultSecondToolbarState extends State<DefaultSecondToolbar> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DashboardJobEnumWrapper>(
              create: (_) => DashboardJobEnumWrapper()),
          ChangeNotifierProvider<SearchTextWrapper>(
              create: (_) => SearchTextWrapper()),
        ],
        child: _DefaultSecondToolbarInternal(
          child: widget.child,
        ));
  }
}

class _DefaultSecondToolbarInternal extends StatefulWidget {
  Widget child;

  _DefaultSecondToolbarInternal({Key? key, required this.child})
      : super(key: key);

  @override
  __DefaultSecondToolbarInternalState createState() =>
      __DefaultSecondToolbarInternalState();
}

class __DefaultSecondToolbarInternalState
    extends State<_DefaultSecondToolbarInternal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(0, 133, 254, 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(
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
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ChatWelcomeScreen();
                        }));
                      },
                      child: const Text(
                        "Chat",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: context
                                      .watch<DashboardJobEnumWrapper>()
                                      .value !=
                                  JobEnum.JOB_OFFER
                              ? ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 133, 254, 1.0)))),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 133, 254, 1.0)),
                                  textStyle: MaterialStateProperty.all(
                                      Theme.of(context).textTheme.headline4),
                                )
                              : OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  fixedSize: const Size(100, 40),
                                ),
                          onPressed: () {
                            context.read<DashboardJobEnumWrapper>().value =
                                JobEnum.JOB_OFFER;
                            var name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).popUntil((route) =>
                                  route.settings.name == "DashboardPage");
                            }
                            name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  settings: const RouteSettings(
                                      name: "DashboardPage"),
                                  builder: (context) => DashboardPage()));
                            }
                          },
                          child: const Text(
                            "Job Offers",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextButton(
                          style: context
                                      .watch<DashboardJobEnumWrapper>()
                                      .value !=
                                  JobEnum.ALL
                              ? ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 133, 254, 1.0)))),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 133, 254, 1.0)),
                                  textStyle: MaterialStateProperty.all(
                                      Theme.of(context).textTheme.headline4),
                                )
                              : OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  fixedSize: const Size(100, 40),
                                ),
                          onPressed: () {
                            context.read<DashboardJobEnumWrapper>().value =
                                JobEnum.ALL;
                            var name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).popUntil((route) =>
                                  route.settings.name == "DashboardPage");
                            }
                            name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  settings: const RouteSettings(
                                      name: "DashboardPage"),
                                  builder: (context) => DashboardPage()));
                            }
                          },
                          child: const Text(
                            "All",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextButton(
                          style: context
                                      .watch<DashboardJobEnumWrapper>()
                                      .value !=
                                  JobEnum.JOB_REQUEST
                              ? ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 133, 254, 1.0)))),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 133, 254, 1.0)),
                                  textStyle: MaterialStateProperty.all(
                                      Theme.of(context).textTheme.headline4),
                                )
                              : OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  fixedSize: const Size(100, 40),
                                ),
                          onPressed: () {
                            context.read<DashboardJobEnumWrapper>().value =
                                JobEnum.JOB_REQUEST;
                            var name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).popUntil((route) =>
                                  route.settings.name == "DashboardPage");
                            }
                            name = ModalRoute.of(context)!.settings.name;
                            if (name != "DashboardPage") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  settings: const RouteSettings(
                                      name: "DashboardPage"),
                                  builder: (context) => DashboardPage()));
                            }
                          },
                          child: const Text(
                            "Job Requests",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: Theme.of(context).textTheme.subtitle2),
                          style: Theme.of(context).textTheme.headline4,
                          cursorColor: Colors.white,
                          onSubmitted: (value) {
                            context.read<DashboardJobEnumWrapper>().value =
                                context.read<DashboardJobEnumWrapper>().value;
                          },
                          onChanged: (value) {
                            context.read<SearchTextWrapper>().value = value;
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}
