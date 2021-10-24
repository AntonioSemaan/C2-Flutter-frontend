import 'package:flutter/material.dart';
import '../chat_widget.dart';
import '../constants.dart';

class ZoomImage extends StatelessWidget {
  final String url;
  static const String id = "ZoomImage";

  const ZoomImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FULL PHOTO',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ZoomImageScreen(url: url),
    );
  }
}

class ZoomImageScreen extends StatefulWidget {
  final String url;

  ZoomImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  State createState() => ZoomImageScreenState(url: url);
}

class ZoomImageScreenState extends State<ZoomImageScreen> {
  final String url;

  ZoomImageScreenState({Key? key, required this.url});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatWidget.widgetFullPhoto(context, url);
  }
}
