import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.white,size: 60.0,),
        SizedBox(height: 15.0,),
        Text(text,style: TextStyle(fontSize: 15.0,color: LabelColour),),
      ],
    );
  }
}