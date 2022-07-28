import 'package:flutter/material.dart';
import '../screens/results.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? butonTitle;
  BottomButton(@required this.butonTitle, @required this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            butonTitle as String,
            style: KLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: KActiveCardColor,
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}
