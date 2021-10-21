import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Master extends StatefulWidget {
  final Widget content;
  final List<Widget>? toolBar;
  final List<Widget>? secondToolBar;
  final MainAxisAlignment? toolBarAlignment;
  final MainAxisAlignment? secondToolBarAlignment;

  Master(
      {Key? key,
      required this.content,
      this.toolBar = const <Widget>[],
      this.secondToolBar = const <Widget>[],
      this.toolBarAlignment = MainAxisAlignment.end,
      this.secondToolBarAlignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/main_icon.png',
              height: 140,
              width: 225,
            ),
            Expanded(
                child: Container(
              height: 140,
              color: const Color.fromRGBO(0, 133, 254, 1.0),
              child: Row(
                  mainAxisAlignment: widget.toolBarAlignment!,
                  children: widget.toolBar!),
            ))
          ],
        ),
        Container(
            child: widget.secondToolBar == null
                ? null
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color.fromRGBO(0, 133, 254, 1.0),
                        child: Row(
                          mainAxisAlignment: widget.secondToolBarAlignment!,
                          children: widget.secondToolBar!,
                        ),
                      ),
                    ),
                )),
        Expanded(child: widget.content),
      ],
    );
  }
}
