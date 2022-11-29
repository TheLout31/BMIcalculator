import 'package:flutter/material.dart';
import 'constants.dart';

class icon_widget extends StatelessWidget {
  icon_widget({required this.icon, required this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(height: 10),
        Text(
          gender,
          style: textStyle,
        )
      ],
    );
  }
}
