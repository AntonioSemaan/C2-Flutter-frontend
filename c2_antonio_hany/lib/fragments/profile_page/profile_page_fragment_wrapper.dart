import 'package:flutter/widgets.dart';

class ProfilePageFragmentWrapper extends StatefulWidget {
  Widget child;
  ProfilePageFragmentWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _ProfilePageFragmentWrapperState createState() =>
      _ProfilePageFragmentWrapperState();
}

class _ProfilePageFragmentWrapperState
    extends State<ProfilePageFragmentWrapper> {
  @override
  Widget build(BuildContext context) {
    double desiredHeight = 600;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: desiredHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(0, 133, 254, 1.0),
        ),
        child: widget.child,
      ),
    );
  }
}
