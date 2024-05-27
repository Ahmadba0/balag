// ignore_for_file: avoid_unnecessary_containers, file_names, deprecated_member_use

import 'package:flutter/material.dart';

class CustomButtonSendAddPalagPolice extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomButtonSendAddPalagPolice(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 4, 54, 95),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
