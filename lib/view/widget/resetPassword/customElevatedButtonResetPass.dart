// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomElevatedButtonResetPass extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButtonResetPass(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            side: const BorderSide(
                color: Color.fromARGB(255, 164, 188, 200), width: 1.5),
            // ignore: deprecated_member_use
            primary: const Color.fromARGB(255, 4, 45, 95),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 75)),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
        ),
      ),
    );
  }
}
