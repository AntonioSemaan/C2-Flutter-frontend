import 'package:c2_antonio_hany/cloned_package/chat_data.dart';
import 'package:c2_antonio_hany/cloned_package/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
