// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class CustomDrop extends StatelessWidget {
  final List items;
  final void Function(Object?) onChanged;
  final valuee;
  final String text;
  final Widget widgetIcon;
  //final DropdownMenuItem<Object> e;
  const CustomDrop({
    super.key,
    required this.items,
    required this.onChanged,
    required this.valuee,
    required this.text,
    required this.widgetIcon,
    //required this.e,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42),
      //  padding: EdgeInsets.symmetric(horizontal: 70),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 247, 237, 158), width: 2),
          color: Color.fromARGB(255, 4, 45, 95),
          borderRadius: BorderRadius.circular(25)),
      child: DropdownButtonFormField(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 70),
        hint: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 167, 196, 230)),
        ),
        items: items
            .map((e) => DropdownMenuItem(

                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                        // height: 0,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 167, 196, 230)),
                  ),
                ),
                value: e))
            .toList(),
        onChanged: onChanged,
        value: valuee,
        /* style: TextStyle(
            color: Colors.green, fontSize: 15, fontStyle: FontStyle.normal),*/
        dropdownColor: const Color.fromARGB(255, 4, 54, 95),
        isExpanded: true,
        icon: widgetIcon,

        //icon color
        decoration: InputDecoration(enabled: false),
        iconEnabledColor: Color.fromARGB(255, 247, 237, 158),
      ),
    );
  }
}
/*
(value) {
          setState(() {
            selectedCity = value;
          });
          */