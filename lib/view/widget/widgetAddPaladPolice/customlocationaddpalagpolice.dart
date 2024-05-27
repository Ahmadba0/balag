import 'package:flutter/material.dart';

class CustomLocationAddPalagPolice extends StatelessWidget {
  final String currentAddress;
  const CustomLocationAddPalagPolice({super.key, required this.currentAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      //location
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 54, 95),
          borderRadius: BorderRadius.circular(35)),
      child: Text(
        currentAddress,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
