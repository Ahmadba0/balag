// ignore_for_file: body_might_complete_normally_nullable

import 'package:balag/core/constant/routename.dart';
import 'package:balag/core/services/servises.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "4") {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (myServices.sharedPref.getString("step") == "3") {
      return const RouteSettings(name: AppRoutes.infoGet);
    }
    if (myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.verifycodesignup);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.location);
    }
    if (myServices.sharedPref.getString("step") == "0") {
      return const RouteSettings(name: AppRoutes.infoGet);
    }

    // return null;
  }
}
