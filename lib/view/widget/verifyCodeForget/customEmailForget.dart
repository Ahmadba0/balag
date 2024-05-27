// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomEmailForget extends StatelessWidget {
  final String text;
  const CustomEmailForget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 167, 196, 230),
            fontSize: 30,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
