import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/image/school1.png",
        //height: double.infinity,
      ),
    );
  }
}
