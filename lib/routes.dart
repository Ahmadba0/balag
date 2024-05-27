import 'package:balag/core/constant/routename.dart';
import 'package:balag/view/screen/home.dart';
import 'package:balag/view/screen/info/infoget.dart';
import 'package:balag/view/screen/info/loactionPage.dart';
import 'package:balag/view/screen/info/verifyCodeSignup.dart';
import 'package:balag/view/screen/onBoarding.dart';
import 'package:get/get.dart';

import 'core/midleware/mymidleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const OnBoarding(),
    middlewares: [MyMiddleware()],
  ),
  GetPage(name: AppRoutes.location, page: () => const LocationPage()),
  GetPage(name: AppRoutes.infoGet, page: () => const InfoGet()),
  GetPage(
      name: AppRoutes.verifycodesignup, page: () => const VerifyCodeSignup()),
  //home
  GetPage(name: AppRoutes.home, page: () => const Home()),
];
