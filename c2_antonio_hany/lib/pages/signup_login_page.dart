import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/fragments/custom_expansion_panel.dart';
import 'package:c2_antonio_hany/fragments/login_signup/login_form_fragment.dart';
import 'package:c2_antonio_hany/fragments/login_signup/signup_form_fragment.dart';
import 'package:c2_antonio_hany/master.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpLogInPage extends StatefulWidget {
  final LoginSignUpFlag operationFlag;
  const SignUpLogInPage({Key? key, required this.operationFlag})
      : super(key: key);

  @override
  _SignUpLogInPageState createState() => _SignUpLogInPageState();
}

class _SignUpLogInPageState extends State<SignUpLogInPage> {
  late List<bool> isOpens;

  @override
  void initState() {
    isOpens = [
      (widget.operationFlag == LoginSignUpFlag.SIGNUP),
      (widget.operationFlag == LoginSignUpFlag.LOGIN)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double desiredHeight = 500;
    double desiredWidth = 600;

    double calculatedHeight = screenSize.height * 0.70;
    double calculatedWidth = screenSize.width * 0.50;

    return Master(
        content: Container(
      color: Colors.white,
      child: Center(
        child: Container(
          height: calculatedHeight > desiredHeight
              ? calculatedHeight
              : desiredHeight,
          width:
              calculatedWidth > desiredWidth ? calculatedWidth : desiredWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromRGBO(0, 133, 254, 1.0),
          ),
          child: Center(
            child: SizedBox(
              width: desiredWidth - 50,
              height: desiredHeight - 50,
              child: SingleChildScrollView(
                child: CustomExpansionPanelList(
                  children: [
                    CustomExpansionPanel(
                        hasTrailingIcon: false,
                        headerBuilder: (context, isOpen) {
                          return Center(
                              child: Text(
                            "Sign Up",
                            style: Theme.of(context).textTheme.headline3,
                          ));
                        },
                        body: SignUpFormFragment(),
                        canTapOnHeader: true,
                        isExpanded: isOpens[0]),
                    CustomExpansionPanel(
                        hasTrailingIcon: false,
                        headerBuilder: (context, isOpen) {
                          return Center(
                              child: Text(
                            "Log In",
                            style: Theme.of(context).textTheme.headline3,
                          ));
                        },
                        body: LogInFormFragment(),
                        canTapOnHeader: true,
                        isExpanded: isOpens[1]),
                  ],
                  expansionCallback: (index, isOpen) {
                    if (isOpen) {
                      return;
                    } else {
                      if (mounted) {
                        setState(() {
                          for (int i = 0; i < isOpens.length; i++) {
                            if (i == index) {
                              isOpens[i] = !isOpens[i];
                            } else {
                              isOpens[i] = false;
                            }
                          }
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
