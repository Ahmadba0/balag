import 'package:flutter/material.dart';

class CustomTextFormFieldLocation extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  const CustomTextFormFieldLocation(
      {super.key, required this.labelText, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: prefixIcon,
          //hintText: "Name",

          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 4, 54, 95),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: const Color.fromARGB(255, 4, 54, 95), width: 1),
          ),
        ),
      ),
    );
  }
}
