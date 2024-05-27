import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(255, 4, 54, 95), fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 50,
    );
  }
}
