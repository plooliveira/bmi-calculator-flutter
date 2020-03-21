import 'package:flutter/material.dart';

class RoundCustomButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundCustomButton({@required this.icon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xaa1B0B21),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      elevation: 0.0,
      child: Icon(this.icon),
    );
  }
}