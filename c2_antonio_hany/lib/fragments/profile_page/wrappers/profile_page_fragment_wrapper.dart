import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePageFragmentWrapper extends StatefulWidget {
  Widget child;
  double? desiredHeight;
  double? desiredWidth;
  ProfilePageFragmentWrapper(
      {Key? key, required this.child, this.desiredHeight, this.desiredWidth})
      : super(key: key);

  @override
  _ProfilePageFragmentWrapperState createState() =>
      _ProfilePageFragmentWrapperState();
}

class _ProfilePageFragmentWrapperState
    extends State<ProfilePageFragmentWrapper> {
  @override
  Widget build(BuildContext context) {
    double desiredHeight = 435;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
        width: widget.desiredWidth,
        height: widget.desiredHeight ?? desiredHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: widget.child,
      ),
    );
  }
}
