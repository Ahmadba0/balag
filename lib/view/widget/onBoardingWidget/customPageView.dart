// ignore_for_file: file_names, deprecated_member_use

import 'package:balag/controller/onBoarding_controller.dart';
import 'package:balag/core/constant/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageView extends GetView<onBoardingControllerImp> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onBoardingList[index].image!,
              height: 280,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              onBoardingList[index].title!,
              style: TextStyle(
                  color: Color.fromARGB(255, 4, 45, 95), fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                onBoardingList[index].body!,
                style: TextStyle(color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
