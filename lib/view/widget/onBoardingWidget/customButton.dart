// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:balag/controller/onBoarding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<onBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
            backgroundColor: Color.fromARGB(255, 4, 45, 95),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            side: BorderSide(color: Color.fromARGB(255, 247, 237, 158))),
        child: Text(
          "التالي",
          style: TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
        ),
      ),
    );
  }
}
