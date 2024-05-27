// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomresendForget extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomresendForget(
      {super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            text1,
            style: const TextStyle(
                color: Color.fromARGB(255, 4, 54, 95), fontSize: 18),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: const TextStyle(
                  color: Color.fromARGB(255, 167, 196, 230), fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
