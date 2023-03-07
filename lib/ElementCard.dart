import 'package:flutter/material.dart';

class ElementCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ElementCard({required this.colour, this.cardChild=const Text(" ")});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}