import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextOnBottomSheet extends StatelessWidget {
  const CustomTextOnBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.75,
        height: Get.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Color.fromARGB(255, 4, 45, 95),
        ),
        child: const Text(
          "choose image : ",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ));
  }
}
