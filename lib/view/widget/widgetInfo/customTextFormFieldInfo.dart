// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class CustomTextFormFieldInfo extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final TextEditingController mycontroller;
  final bool? isnumber;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const CustomTextFormFieldInfo(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      required this.mycontroller,
      this.isnumber,
      this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        cursorColor: const Color.fromARGB(255, 4, 54, 95),
        style: const TextStyle(
          color: Color.fromARGB(255, 167, 196, 230),
          decoration: TextDecoration.none,
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType:
            isnumber == true ? TextInputType.number : TextInputType.name,
        controller: mycontroller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: labelText,

          suffixIcon: prefixIcon,
          //hintText: "Name",

          labelStyle: const TextStyle(
            //color: Color.fromARGB(255, 4, 54, 95),
            color: Color.fromARGB(255, 167, 196, 230),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                //color: Color.fromARGB(255, 164, 188, 200)
                color: Color.fromARGB(255, 167, 196, 230),
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 4, 54, 95), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
