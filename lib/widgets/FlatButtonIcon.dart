import 'package:flutter/material.dart';


class FlatButtonIcon extends StatelessWidget {
  FlatButtonIcon({
    @required this.color,
    @required this.icon,
    @required this.label,
    @required this.onPressed,
  });
  final Color color;
  final Icon icon;
  final Text label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      color: color,
      icon: icon,
      onPressed: onPressed, 
      label: label,
    );
  }
}
