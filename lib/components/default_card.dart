import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultCard extends StatelessWidget {
  final Color colorBase;
  final cardChild;
  final Function onPress;
  DefaultCard({@required this.colorBase, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: cardChild,
        decoration: BoxDecoration(

            color: colorBase, //Color(0xff1D1F33)
            borderRadius: BorderRadius.circular(7.0)),
      ),
    );
  }
}