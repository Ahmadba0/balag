// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';

class CustomButtonLocation extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtonLocation({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side:
              BorderSide(color: Color.fromARGB(255, 164, 188, 200), width: 1.5),
          primary: Color.fromARGB(255, 4, 45, 95),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 90)),
      child: Text(
        text,
        style: TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
      ),
    );
  }
}
/*
() {
                      Get.to(LocationPage());
                    }
                    */