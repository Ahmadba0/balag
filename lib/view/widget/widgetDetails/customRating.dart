// ignore_for_file: file_names

import 'package:balag/view/widget/widgetDetails/customGestureDetector.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;
  final void Function()? onTap4;
  final void Function()? onTap5;
  final color;
  const CustomRating(
      {super.key,
      this.onTap1,
      this.color,
      this.onTap2,
      this.onTap3,
      this.onTap4,
      this.onTap5});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 4, 54, 95),
        ),
      ),
      child: Row(
        children: [
          //1
          CustomGestureDetector(
            onTap: onTap1,
            color: color,
          ),
          //2
          CustomGestureDetector(
            onTap: onTap2,
            color: color,
          ),
          //3
          CustomGestureDetector(
            onTap: onTap3,
            color: color,
          ),
          //4
          CustomGestureDetector(
            onTap: onTap4,
            color: color,
          ),

          //5
          CustomGestureDetector(
            onTap: onTap5,
            color: color,
          ),
          //
          //
          //
          const Spacer(),
          const Text(
            "أضف تقييمك",
            style:
                TextStyle(color: Color.fromARGB(255, 4, 54, 95), fontSize: 20),
          )
        ],
      ),
      //
    );
  }
}
