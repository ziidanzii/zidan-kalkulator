import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String value;
  final double fontSize;
  final Color backgroundColor;

  const TextFieldWidget({
    super.key,
    required this.value,
    this.fontSize = 24,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
    );
  }
}
