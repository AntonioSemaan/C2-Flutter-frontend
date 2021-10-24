import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat/chatData.dart';
import 'package:flutter_chat/chatWidget.dart';

class ChatWelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _ChatWelcomeScreenState createState() => _ChatWelcomeScreenState();
}

class _ChatWelcomeScreenState extends State<ChatWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    ChatData.init("Job Book", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatWidget.getAppBar(ChatData.appName),
        backgroundColor: Colors.white,
        body: ChatWidget.widgetWelcomeScreen(context));
  }
}
