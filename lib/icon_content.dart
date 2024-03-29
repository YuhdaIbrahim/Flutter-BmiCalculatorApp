import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon({this.icons, this.label});

  final IconData icons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: cLabelStyle,
        )
      ],
    );
  }
}
