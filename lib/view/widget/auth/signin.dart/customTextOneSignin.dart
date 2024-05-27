import 'package:flutter/material.dart';

class CustomTextOneSignin extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomTextOneSignin(
      {super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
