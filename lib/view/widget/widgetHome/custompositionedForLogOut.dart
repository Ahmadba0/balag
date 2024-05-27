// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomPositionedLogOut extends StatelessWidget {
  final void Function()? onpress;
  const CustomPositionedLogOut({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
          bottom: 5,
          right: 5,
          child: IconButton(
              onPressed: onpress,
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))),
    );
  }
}
