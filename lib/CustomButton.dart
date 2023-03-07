import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(icon,color: Colors.black,),
      backgroundColor: Color(0x64BFBFBF),
    );
  }
}