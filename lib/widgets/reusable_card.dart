import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPress;
  final Widget? cardChild;
  ReusableCard(@required this.color, this.cardChild, this.onPress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
