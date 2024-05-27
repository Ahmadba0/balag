// ignore_for_file: file_names, camel_case_types

import 'package:balag/core/constant/static.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  PageController? pageController;
  MyServices myservices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myservices.sharedPref.setString("step", "0");
      Get.offAll(() => const InfoGet());
    } else {
      pageController!.animateToPage(currentPage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
