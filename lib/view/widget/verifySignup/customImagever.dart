// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomImageVer extends StatelessWidget {
  const CustomImageVer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 60, bottom: 30),
      height: 240,
      /* decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),*/
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Positioned(
            left: 61,
            top: 20,
            child: Image.asset(
              "assets/image/logofinal.png",
              fit: BoxFit.fill,
              width: 250,
              //height: 190,*/
            ),
          ),
        ],
      ),
    );
  }
}
