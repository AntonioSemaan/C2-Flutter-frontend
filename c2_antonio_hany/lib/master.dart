import 'package:c2_antonio_hany/data_classes/provider_classes.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/pages/contact_us.dart';
import 'package:c2_antonio_hany/pages/dashboard_page.dart';
import 'package:c2_antonio_hany/pages/home_page.dart';
import 'package:c2_antonio_hany/pages/profile_page.dart';
import 'package:c2_antonio_hany/pages/search_results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Master extends StatefulWidget {
  final Widget content;
  final List<Widget>? toolBar;
  final List<Widget>? secondToolBar;
  final MainAxisAlignment? toolBarAlignment;
  final MainAxisAlignment? secondToolBarAlignment;
  final String? title;
  final bool? hasSearchField;

  Master(
      {Key? key,
      required this.content,
      this.toolBar = const <Widget>[],
      this.secondToolBar = const <Widget>[],
      this.toolBarAlignment = MainAxisAlignment.end,
      this.secondToolBarAlignment = MainAxisAlignment.center,
      this.title = "",
      this.hasSearchField = false})
      : super(key: key);

  @override
  _MasterState createState() => _MasterState();

  static List<Widget> getToolbarForPage(
      BuildContext context, ToolBarForPage flag) {
    return [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(0, 133, 254, 1.0)))),
          foregroundColor: flag == ToolBarForPage.DASHBOARD
              ? MaterialStateProperty.all(
                  const Color.fromRGBO(100, 200, 254, 1.0))
              : MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(0, 133, 254, 1.0)),
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.headline4),
        ),
        onPressed: flag == ToolBarForPage.DASHBOARD
            ? null
            : () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
        child: const Text("Dashboard"),
      ),
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(0, 133, 254, 1.0)))),
          foregroundColor: flag == ToolBarForPage.PROFILE
              ? MaterialStateProperty.all(
                  const Color.fromRGBO(100, 200, 254, 1.0))
              : MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(0, 133, 254, 1.0)),
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.headline4),
        ),
        onPressed: flag == ToolBarForPage.PROFILE
            ? null
            : () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
        child: const Text(
          "Profile",
        ),
      ),
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(0, 133, 254, 1.0)))),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(0, 133, 254, 1.0)),
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.headline4),
        ),
        onPressed: flag == ToolBarForPage.CONTACT_US
            ? null
            : () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ContactUsPage();
                }));
              },
        child: const Text(
          "Contact Us",
        ),
      ),
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(0, 133, 254, 1.0)))),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(0, 133, 254, 1.0)),
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.headline4),
        ),
        onPressed: () {
          gLoggedUser = null;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return const HomePage(title: 'C2 Home');
          }), (route) => false);
        },
        child: const Text(
          "Logout",
        ),
      )
    ];
  }
}

class _MasterState extends State<Master> {
  String? _searchFieldText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Image.asset(
                  'assets/main_icon.png',
                  height: 140,
                  width: 225,
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const HomePage(title: 'C2 Home');
                  }), (route) => false);
                },
              ),
              Expanded(
                  child: Container(
                height: 140,
                color: const Color.fromRGBO(0, 133, 254, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: Text(
                          widget.title!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      )),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                              mainAxisAlignment: widget.toolBarAlignment!,
                              children: widget.toolBar!),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: widget.toolBarAlignment!,
                            children: [
                              Visibility(
                                visible: widget.hasSearchField!,
                                child: Container(
                                    width: 200,
                                    height: 40,
                                    child: widget.hasSearchField!
                                        ? TextField(
                                            decoration: InputDecoration(
                                                hintText: "Search",
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: Colors.white,
                                            onSubmitted: (value) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return SearchResultsPage(
                                                    searchText:
                                                        _searchFieldText!);
                                              }));
                                            },
                                            onChanged: (value) {
                                              _searchFieldText = value;
                                            },
                                          )
                                        : null),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
          Container(
              child: widget.secondToolBar!.isEmpty
                      ? Container(child: null)
                      : Row(
                          mainAxisAlignment: widget.secondToolBarAlignment!,
                          children: widget.secondToolBar!)),
          Expanded(child: widget.content),
        ],
      ),
    );
  }
}
