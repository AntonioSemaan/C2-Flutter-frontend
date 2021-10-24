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
      content: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  "recruitment.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Container(
            height: 400,
            color: Colors.blue[200],
            child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 270.0),
              padding: const EdgeInsets.all(8.0),
              width: 300,
              child: const Text(
                "Post your job for many people to see",
                style: TextStyle(color: Colors.black87, fontSize: 48),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 500),
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    fixedSize:
                        MaterialStateProperty.all(const Size(200, 100)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpLogInPage(
                            operationFlag: LoginSignUpFlag.SIGNUP)));
                  },
                  child: const Text(
                    "Get Started Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 133, 254, 1.0),
                        fontSize: 28),
                  )),
            ),
          ],
            ),
          )
        ],
      ),
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
