// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 4, 45, 95),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 2, color: Color.fromARGB(255, 247, 237, 158))),
        elevation: 7,
        child: Container(
          height: 70,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.blue[100], fontSize: 23),
          )),
        ),
      ),
    );
  }
}
