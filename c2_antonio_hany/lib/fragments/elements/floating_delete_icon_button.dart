import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingDeleteIconButton extends StatefulWidget {
  Function onPressed;

  FloatingDeleteIconButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _FloatingDeleteIconButtonState createState() =>
      _FloatingDeleteIconButtonState();
}

class _FloatingDeleteIconButtonState extends State<FloatingDeleteIconButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        right: 5,
        child: IconButton(
            onPressed: () {
              widget.onPressed.call();
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
            )));
  }
}
