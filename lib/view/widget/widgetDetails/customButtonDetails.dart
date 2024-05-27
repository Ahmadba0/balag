// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButtonDetails extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtonDetails({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[400],
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
