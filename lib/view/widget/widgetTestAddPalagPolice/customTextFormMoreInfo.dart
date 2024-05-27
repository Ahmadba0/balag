// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextFormMoreInfo extends StatelessWidget {
  final TextEditingController mycontrollerl;
  const CustomTextFormMoreInfo({super.key, required this.mycontrollerl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        cursorColor: Color.fromARGB(255, 4, 45, 95),
        style: TextStyle(color: Color.fromARGB(255, 4, 45, 95)),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: mycontrollerl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: "                                                   تفاصيل",
          suffixIcon: const Icon(
            Icons.location_on_outlined,
            color: Color.fromARGB(255, 247, 237, 158),
          ),
          //hintText: "Name",
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 247, 237, 158),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                //color: Color.fromARGB(255, 164, 188, 200)
                color: Color.fromARGB(255, 167, 196, 230),
                width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                //color: Color.fromARGB(255, 164, 188, 200)
                color: Color.fromARGB(255, 167, 196, 230),
                width: 3),
          ),
        ),
      ),
    );
  }
}
