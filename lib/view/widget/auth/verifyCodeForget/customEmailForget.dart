import 'package:flutter/material.dart';

class CustomEmailForget extends StatelessWidget {
  final String text;
  const CustomEmailForget({super.key, required this.text});

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
