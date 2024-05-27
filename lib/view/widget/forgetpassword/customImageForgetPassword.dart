// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageSigninForgetPassword extends StatelessWidget {
  const CustomImageSigninForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        "assets/images/school1.svg",
        height: 200,
      ),
    );
  }
}
