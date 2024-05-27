// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

class CustomLocationAddPALAG extends StatelessWidget {
  final a;
  final b;
  final c;
  final void Function() onpressed;
  const CustomLocationAddPALAG(
      {super.key, required this.a, this.b, this.c, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 247, 237, 158), width: 2),
          color: Color.fromARGB(255, 4, 45, 95),
          borderRadius: BorderRadius.circular(35)),
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          a == null
              ? const Text(
                  "اضغط لتحديد موقعك",
                  style: TextStyle(
                      color: Color.fromARGB(255, 167, 196, 230), fontSize: 18),
                )
              : Text(
                  b,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 167, 196, 230), fontSize: 18),
                ),
          const Spacer(),
          a == null
              ? Container(
                  child: IconButton(
                      onPressed: onpressed,
                      icon: const Icon(Icons.location_on_outlined,
                          size: 27, color: Color.fromARGB(255, 247, 237, 158))),
                )
              : Container(),
        ],
      ),
    );
  }
}
