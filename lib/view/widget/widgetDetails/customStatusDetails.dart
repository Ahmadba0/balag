// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStatusDetails extends StatelessWidget {
  //final int s;
  final Widget widget;
  const CustomStatusDetails({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    //DetailsController controller = Get.put(DetailsController());
    return Positioned(
      right: double.infinity,
      left: Get.width * 0.05,
      //top: double.infinity,
      bottom: Get.width * 0.05,
      child: Container(
        child: widget,
      ),
    );
  }
}
