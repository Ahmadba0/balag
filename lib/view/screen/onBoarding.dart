// ignore_for_file: file_names

import 'package:balag/controller/onBoarding_controller.dart';
import 'package:balag/view/widget/onBoardingWidget/customButton.dart';
import 'package:balag/view/widget/onBoardingWidget/customPageView.dart';
import 'package:balag/view/widget/onBoardingWidget/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: const Column(
          children: [
            //1
            Expanded(flex: 2, child: CustomPageView()),
            //2
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotController(),
                  SizedBox(height: 50),
                  // ignore: avoid_unnecessary_containers
                  CustomButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
