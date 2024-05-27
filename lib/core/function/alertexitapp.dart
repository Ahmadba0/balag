// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(onPressed: () => exit(0), child: Text("نعم")),
        ElevatedButton(onPressed: () => Get.back(), child: Text("لا")),
      ]);
  return Future.value(true);
}
