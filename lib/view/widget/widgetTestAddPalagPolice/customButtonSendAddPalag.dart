// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonSendAddPalag extends StatelessWidget {
  final void Function() onPressed;
  const CustomButtonSendAddPalag({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      //padding: const EdgeInsets.only(left: 110, right: 110),
      child: ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
              title: "تنبيه",
              titleStyle: TextStyle(color: Colors.red[800], fontSize: 25),
              middleText:
                  "يجب عليك ان تكون صادق في بلاغك لأنك تعتبر مسؤول عنها",
              middleTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 4, 45, 95), fontSize: 20),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red[800],
                    )),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.check,
                      color: Colors.green[800],
                    )),
              ]);
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 70),
            backgroundColor: const Color.fromARGB(255, 4, 54, 95),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
                side: BorderSide(
                    color: Color.fromARGB(255, 247, 237, 158), width: 2))),
        child: const Text(
          "إرسال",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
