// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListImageDetails extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;
  const CustomListImageDetails(
      {super.key, required this.img1, required this.img2, required this.img3});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Image.network(
          img1,
          width: Get.width * 0.75,
          height: 180,
        ),
        Image.network(
          img2,
          width: Get.width * 0.75,
          height: 180,
        ),
        Image.network(
          img3,
          width: Get.width * 0.75,
          height: 180,
        )
      ],
    );
  }
}
