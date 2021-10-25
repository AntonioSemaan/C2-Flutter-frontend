import 'dart:html';

import 'package:c2_antonio_hany/pages/chat_welcome_screen.dart';
import 'package:c2_antonio_hany/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WebappMaster extends StatefulWidget {
  WebappMaster({Key? key}) : super(key: key);

  @override
  _WebappMasterState createState() => _WebappMasterState();
}

class _WebappMasterState extends State<WebappMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        children: [
          Container(
            height: 200,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Where everything is joined to one!\n",
                    style: TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  TextSpan(
                    text: "Please choose a module to continue",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )
                ]),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const HomePage(
                            title: "Job Book",
                          );
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        fixedSize: const Size(250, 500),
                        backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                      ),
                      child: const Center(
                          child: Text("Jobook",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 48)))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ChatWelcomeScreen();
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        fixedSize: const Size(250, 500),
                        backgroundColor: const Color.fromRGBO(0, 133, 254, 1.0),
                      ),
                      child: const Center(
                          child: Text("Chat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 48)))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        fixedSize: const Size(250, 500),
                        backgroundColor: Colors.purple,
                      ),
                      child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Reserve\n",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40)),
                                TextSpan(
                                    text: "\nComing soon...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ])))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        fixedSize: const Size(250, 500),
                        backgroundColor: Colors.teal,
                      ),
                      child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Consult\n",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40)),
                                TextSpan(
                                    text: "\nComing soon...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ])))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 17.0),
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        fixedSize: const Size(250, 500),
                        backgroundColor: Colors.green,
                      ),
                      child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Learn/Teach\n",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40)),
                                TextSpan(
                                    text: "\nComing soon...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ])))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
