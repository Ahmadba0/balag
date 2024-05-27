import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInkWellInButtomSheet extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const CustomInkWellInButtomSheet(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
      height: Get.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color.fromARGB(255, 4, 45, 95),
      ),
      child: InkWell(
        //
        //
        onTap: onTap,
        //
        //
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
