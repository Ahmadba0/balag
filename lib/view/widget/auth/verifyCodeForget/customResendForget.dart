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
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 20, color: Colors.grey[750]),
          ),
          InkWell(
            child: Text(
              text2,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
