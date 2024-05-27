// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomTextWithEdit extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomTextWithEdit(
      {super.key, required this.text, required this.onPressed});

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
          child: Stack(
            children: [
              Center(
                  child: Text(
                text,
                style: TextStyle(color: Colors.blue[100], fontSize: 23),
              )),
              Positioned(
                  right: 10,
                  top: 9,
                  child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 247, 237, 158),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
