import 'package:after_layout/after_layout.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/master.dart';
import 'package:c2_antonio_hany/pages/dashboard_page.dart';
import 'package:c2_antonio_hany/pages/signup_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Master(
      content: Container(),
      toolBar: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(color: Colors.white, width: 1),
                fixedSize: const Size(100, 40),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpLogInPage(
                        operationFlag: LoginSignUpFlag.LOGIN)));
              },
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpLogInPage(
                        operationFlag: LoginSignUpFlag.SIGNUP)));
              },
              child: const Text(
                "Get Started",
                style: TextStyle(color: Color.fromRGBO(0, 133, 254, 1.0)),
              )),
        ),
      ],
    ));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (gLoggedUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              settings: const RouteSettings(name: "DashboardPage"),
              builder: (context) => DashboardPage()),
          (route) => false);
    }
  }
}
