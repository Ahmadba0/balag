import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDialogToUpdate() {
  Get.defaultDialog(
      title: "تعديل",
      content: Form(child: TextFormField()),
      actions: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: Colors.red[800],
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Colors.green[800],
            ))
      ]);
}
