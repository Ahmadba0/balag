// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class CustomButtonLocationAddPalagPolice extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomButtonLocationAddPalagPolice(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      //button to get location
      icon: const Icon(
        Icons.location_pin,
        color: Colors.white,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 4, 54, 95),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50)),
    );
  }
}
/*
() {
                          _getCurrentLocation();
                        }
                        */