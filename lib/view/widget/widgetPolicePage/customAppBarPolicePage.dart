import 'package:flutter/material.dart';

String? title;
customAppbarPolicePage() {
  return AppBar(
    title: Text(
      title!,
      style: TextStyle(
          color: const Color.fromARGB(255, 4, 54, 95),
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 50,
  );
}
