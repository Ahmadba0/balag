import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageSignup extends StatelessWidget {
  const CustomImageSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        "assets/image/school1.svg",
        height: 200,
      ),
    );
  }
}
