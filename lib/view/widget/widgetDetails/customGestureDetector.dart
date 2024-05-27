// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  final void Function()? onTap;
  final color;
  const CustomGestureDetector({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          color >= 1 ? Icons.star : Icons.star_border,
          size: 30,
          color: Colors.amber,
        ),
      ),
    );
  }
}
