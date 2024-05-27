// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomImageLoc extends StatelessWidget {
  const CustomImageLoc({super.key});

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
            left: 105,
            top: 20,
            child: Image.asset(
              "assets/image/balagonalogo.png",
              fit: BoxFit.fill,
              width: 200,
              //height: 190,*/
            ),
          ),
        ],
      ),
    );
  }
}
