import 'package:flutter/widgets.dart';
import '../constants.dart';

class MaleFemaleDecoration extends StatelessWidget {
  final IconData icon;
  final String label;
  MaleFemaleDecoration({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      //TODO: Extract this widget and replace for custom widget
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}