import 'package:flutter/material.dart';

class CustomBodyDetails extends StatelessWidget {
  final String body;
  const CustomBodyDetails({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: 150,
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
                color: const Color.fromARGB(255, 45, 4, 95), width: 2),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                //  bottomRight: Radius.circular(35),
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35))),
        child: Text(
          body,
          style: const TextStyle(
              fontSize: 28, color: Color.fromARGB(255, 45, 4, 95)),
        ));
  }
}
