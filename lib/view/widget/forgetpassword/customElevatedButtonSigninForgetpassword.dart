// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomElevatedButtonForgetpassword extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButtonForgetpassword(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            side: const BorderSide(
                color: Color.fromARGB(255, 164, 188, 200), width: 1.5),
            // ignore: deprecated_member_use
            primary: const Color.fromARGB(255, 4, 45, 95),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50)),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
        ),
      ),
    );
  }
}
