// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomInkButtonMoreInfo extends StatelessWidget {
  final void Function()? onTap;
  const CustomInkButtonMoreInfo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: onTap,
        child: Text(
          "معلومات إضافية",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontSize: 20,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 247, 237, 158)),
        ),
      ),
    );
  }
}
