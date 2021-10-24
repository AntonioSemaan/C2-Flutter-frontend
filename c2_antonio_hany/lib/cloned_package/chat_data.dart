import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'chat_db.dart';
import 'chat_widget.dart';
import 'constants.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';

class ChatData {
  static String appName = "Job Book";

  static Future<bool> openDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.only(
                left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: const Color.fromRGBO(0, 133, 254, 1.0),
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: const Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(bottom: 10.0),
                    ),
                    ChatWidget.widgetShowText(
                        'Are you sure you want to exit to exit app?', '', ''),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.white70,
                      ),
                      margin: const EdgeInsets.only(right: 10.0),
                    ),
                    ChatWidget.widgetShowText('Cancel', '', ''),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.white70,
                      ),
                      margin: const EdgeInsets.only(right: 10.0),
                    ),
                    ChatWidget.widgetShowText('Yes', '', ''),
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        return false;
      case 1:
        return true;
      default:
        return false;
    }
  }

  static Future<Null> handleSignOut(BuildContext context) async {
    await Firebase.initializeApp();
    final GoogleSignInPlugin googleSignIn = GoogleSignInPlugin();
    await googleSignIn.init(
        clientId:
            "628421221680-0sg12ihrf129j9csbod5b3cpe1qvruo1.apps.googleusercontent.com");

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  static Future<bool> authUsersGoogle(BuildContext context) async {
    await Firebase.initializeApp();
    final GoogleSignInPlugin googleSignIn = GoogleSignInPlugin();
    await googleSignIn.init(
        clientId:
            "628421221680-0sg12ihrf129j9csbod5b3cpe1qvruo1.apps.googleusercontent.com");

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    GoogleSignInUserData? googleUser = await googleSignIn.signIn();

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleUser!.idToken,
    );

    final UserCredential logInUser =
        await firebaseAuth.signInWithCredential(credential);

    if (logInUser != null) {
      // Check is already sign up
      await ChatDBFireStore.checkUserExists(firebaseAuth.currentUser!);

      final User logInUser =
          (await firebaseAuth.signInWithCredential(credential)).user!;

      /**
       * Make user online
       */
      await ChatDBFireStore.makeUserOnline(logInUser);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashboardScreen(currentUserId: logInUser.uid)));
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkUserLoggedin(BuildContext context) async {
    User user = FirebaseAuth.instance.currentUser!;
    if (user != null)
      return true;
    else
      return false;
  }

  static String getGroupChatID(String logInUserId, String peerId) {
    if (logInUserId.hashCode <= peerId.hashCode) {
      return '$logInUserId-$peerId';
    } else {
      return '$peerId-$logInUserId';
    }
  }

  static Future<bool> isSignedIn() async {
    final GoogleSignInPlugin googleSignIn = GoogleSignInPlugin();
    await googleSignIn.init(
        clientId:
            "628421221680-0sg12ihrf129j9csbod5b3cpe1qvruo1.apps.googleusercontent.com");

    bool isLoggedIn = await googleSignIn.isSignedIn();
    return isLoggedIn;
  }

  static void authUser(BuildContext context) async {
    bool isValidUser = await ChatData.authUsersGoogle(context);
    //print('isValid' + isValidUser.toString());
    if (isValidUser) {
      //if (await ChatData.isSignedIn()) {
      ////print('sign in signin');
      //ChatData.checkUserLogin(context);

    } else {
      //print('sign in fail');
      Fluttertoast.showToast(msg: "Sign in fail");
    }
  }

  static init(String applicationName, BuildContext context) {
    appName = applicationName;

    //startTime(context);
    checkUserLogin(context);
  }

  static checkUserLogin(BuildContext context) async {
    await Firebase.initializeApp();
    final GoogleSignInPlugin googleSignIn = GoogleSignInPlugin();
    await googleSignIn.init(
        clientId:
            "628421221680-0sg12ihrf129j9csbod5b3cpe1qvruo1.apps.googleusercontent.com");

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (await isSignedIn() == true) {
      GoogleSignInUserData? googleUser = await googleSignIn.signIn();

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleUser!.idToken,
      );

      final User logInUser =
          (await firebaseAuth.signInWithCredential(credential)).user!;

      /**
       * Make user online
       */
      await ChatDBFireStore.makeUserOnline(logInUser);

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             DashboardScreen(currentUserId: logInUser.uid)));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashboardScreen(currentUserId: logInUser.uid)));
    } else {
      //return ChatData.widgetLoginScreen(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  static startTime(BuildContext context) async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, checkUserLogin(context));
  }

  static bool isLastMessageLeft(var listMessage, String id, int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1].get('idFrom') == id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLastMessageRight(var listMessage, String id, int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1].get('idFrom') != id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }
}
