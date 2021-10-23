import 'package:flutter/widgets.dart';

class ProfilePagePanelWrapper extends StatefulWidget {
  Widget child;
  ProfilePagePanelWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _ProfilePagePanelWrapperState createState() =>
      _ProfilePagePanelWrapperState();
}

class _ProfilePagePanelWrapperState
    extends State<ProfilePagePanelWrapper> {
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
