import 'package:flutter/material.dart';

class CustomFinalTextSignup extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomFinalTextSignup(
      {super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: Text(
              text1,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          InkWell(
            child: Text(text2),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
