import 'package:flutter/material.dart';
import 'package:ibm_calculater/constants.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? label;
  IconContent(@required this.icon, @required this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label as String,
          style: KLabelTextStyel,
        )
      ],
    );
  }
}
