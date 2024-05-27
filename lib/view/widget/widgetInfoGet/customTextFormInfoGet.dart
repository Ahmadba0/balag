// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormInfoGet extends StatelessWidget {
  final TextEditingController mycontroller;
  final String text;
  final bool? isnumber;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const CustomTextFormInfoGet(
      {super.key,
      required this.mycontroller,
      required this.text,
      this.isnumber,
      this.obscureText,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText == null || obscureText == false ? false : true,
        controller: mycontroller,
        keyboardType:
            isnumber == true ? TextInputType.number : TextInputType.name,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },

        ///
        //
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: text,
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 167, 196, 230),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 167, 196, 230), width: 1),
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
