import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.label});

  final Function onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: cBottomColourContainer,
        margin: EdgeInsets.only(top: 5),
        width: double.infinity,
        height: cBottomContainerHeight,
        child: Center(
            child: Text(
          label,
          style: cLargeStyle,
        )),
      ),
    );
  }
}
