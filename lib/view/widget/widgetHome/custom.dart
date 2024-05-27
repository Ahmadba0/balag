// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CustomUserAccount extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomUserAccount(
      {super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UserAccountsDrawerHeader(
        accountName: Text(text1),
        accountEmail: Text(text2),
        currentAccountPicture: const CircleAvatar(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          backgroundImage: AssetImage("assets/image/logofinal.png"),
        ),
        decoration: const BoxDecoration(
            //  color: Color.fromARGB(221, 26, 81, 177)
            border: Border(
                bottom: BorderSide(
                    color: Color.fromARGB(255, 50, 97, 177), width: 2))),
      ),
    );
  }
}

//"${controller.myServices.sharedPref.getString("name")}"
//"${controller.myServices.sharedPref.getString("number")}"