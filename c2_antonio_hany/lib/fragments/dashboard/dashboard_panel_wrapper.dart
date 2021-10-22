import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardPanelWrapper extends StatefulWidget {
  Widget child;
  bool? hasBorder;
  bool? hasMargin;

  DashboardPanelWrapper(
      {Key? key,
      required this.child,
      this.hasBorder = true,
      this.hasMargin = false})
      : super(key: key);

  @override
  _DashboardPanelWrapperState createState() => _DashboardPanelWrapperState();
}

class _DashboardPanelWrapperState extends State<DashboardPanelWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: widget.hasMargin!
            ? const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20)
            : null,
        decoration: BoxDecoration(
          color: Colors.white,
          border: widget.hasBorder!
              ? Border.all(
                  color: const Color.fromRGBO(
                    0,
                    133,
                    254,
                    1.0,
                  ),
                  style: BorderStyle.solid,
                  width: 2)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ),
    );
  }
}
