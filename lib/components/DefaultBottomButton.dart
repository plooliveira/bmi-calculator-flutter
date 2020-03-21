import 'package:flutter/material.dart';
import '../constants.dart';

class DefaultBottomButton extends StatelessWidget {

  DefaultBottomButton({@required this.onTap, @required this.label});

  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        // bottom app bar
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 75.0,
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomAppBar,
        child: Center(
          child: Text(
            this.label,
            style: kLargeButtonText,
          ),
        ),
      ),
    );
  }
}