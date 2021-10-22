import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardPanelWrapper extends StatefulWidget {
  Widget child;

  DashboardPanelWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _DashboardPanelWrapperState createState() => _DashboardPanelWrapperState();
}

class _DashboardPanelWrapperState extends State<DashboardPanelWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color.fromRGBO(
                0,
                133,
                254,
                1.0,
              ),
              style: BorderStyle.solid,
              width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.child,
      ),
    );
  }
}
