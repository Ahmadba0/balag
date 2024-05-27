import 'package:flutter/material.dart';

class CustomEmail extends StatelessWidget {
  final String text;
  const CustomEmail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 30, fontStyle: FontStyle.italic),
      ),
    );
  }
}
