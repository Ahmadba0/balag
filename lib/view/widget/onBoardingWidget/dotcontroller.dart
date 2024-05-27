import 'package:balag/controller/onBoarding_controller.dart';
import 'package:balag/core/constant/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.all(2),
                    duration: const Duration(milliseconds: 800),
                    width: controller.currentPage == index ? 15 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 45, 95),
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
