// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomLocationDetails extends StatelessWidget {
  final String location;
  const CustomLocationDetails({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: 70,
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border:
              Border.all(color: const Color.fromARGB(255, 45, 4, 95), width: 2),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
            topLeft: Radius.circular(35),
            //topRight: Radius.circular(35),
          ),
        ),
        child: Text(
          location
          //  "${reportmodel.policeReportLocation}"
          ,
          style: const TextStyle(
              fontSize: 28, color: Color.fromARGB(255, 45, 4, 95)),
        ));
  }
}
