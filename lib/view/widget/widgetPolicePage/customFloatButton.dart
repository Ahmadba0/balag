// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class CustomFloatButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomFloatButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Color.fromARGB(221, 14, 58, 134),
      //foregroundColor: const Color.fromARGB(255, 45, 4, 95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Icon(Icons.add,
          size: 35, color: Color.fromARGB(255, 247, 237, 158)),
    );
  }
}
