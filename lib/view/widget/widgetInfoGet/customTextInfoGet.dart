// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class CustomTextInfoGet extends StatelessWidget {
  final String text1;
  final String text2;

  final void Function() onTap;
  const CustomTextInfoGet(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7, right: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            text1,
            style:
                TextStyle(color: Color.fromARGB(255, 4, 54, 95), fontSize: 18),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: TextStyle(
                  color: Color.fromARGB(255, 167, 196, 230), fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
