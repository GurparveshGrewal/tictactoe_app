import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final List<Shadow> shadows;
  final double size;
  const CustomText(
      {required this.text,
      required this.shadows,
      required this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: shadows,
        fontSize: size,
      ),
    );
  }
}
