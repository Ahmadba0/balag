// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomElevatedButtonInfoGet extends StatelessWidget {
  final void Function() onPressed;
  const CustomElevatedButtonInfoGet({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              side: const BorderSide(
                  color: Color.fromARGB(255, 164, 188, 200), width: 1.5),
              primary: const Color.fromARGB(255, 4, 45, 95),
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 50)),
          child: const Text(
            "تسجيل الدخول",
            style: TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
          )),
    );
  }
}
