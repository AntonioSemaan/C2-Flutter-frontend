import 'package:after_layout/after_layout.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:c2_antonio_hany/jobook_master.dart';
import 'package:c2_antonio_hany/pages/dashboard_page.dart';
import 'package:c2_antonio_hany/pages/signup_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return JobookMaster(
      toolBar: JobookMaster.getToolbarForPage(context, ToolBarForPage.PROFILE),
      content: SingleChildScrollView(
        child: Container(
          color: Colors.blue[300],
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Text>[
                      Text(
                        "To contact the developers, please do so throught email using one of the following",
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                      Text(
                        "Antonio Semaan: antonio.semaan@isae.edu.lb",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "Hany Abboud: hany.abboud@isae.edu.lb",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
        ),
      ),
    );
  }
}
