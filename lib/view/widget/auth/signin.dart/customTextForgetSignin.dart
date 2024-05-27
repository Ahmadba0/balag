import 'package:flutter/material.dart';

class CustomTextForgetSignin extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomTextForgetSignin({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
