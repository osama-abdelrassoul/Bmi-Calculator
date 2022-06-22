import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(@required this.color, this.cardChild);

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
