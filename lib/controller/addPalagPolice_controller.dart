/*import 'dart:io';

import 'package:balag/view/screen/addbalagPolice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../view/widget/widgetAddPalagPolice/customTextOnBottomSheet.dart';

class AddPalagPoliceController extends GetxController {
  File? myfile;

  //
  //methods
  //

  onPressOnIconCamera(var context) {
    showModalBottomSheet(
      //
      //
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTextOnBottomSheet(),
              //
              const SizedBox(height: 10),
              //
              Container(
                width: Get.width * 0.75,
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color.fromARGB(255, 4, 45, 95),
                ),
                child: InkWell(
                  //
                  //
                  onTap: () async {
                    XFile? xfile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    Navigator.of(context).pop();
                    myfile == null
                        ? Get.to(AddBalagPolice())
                        : File(xfile!.path);
                    // myfile = File(xfile!.path);

                    //setState(() {});
                  },
                  //
                  //
                  child: const Text(
                    "camera",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width * 0.75,
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color.fromARGB(255, 4, 45, 95),
                ),
                child: InkWell(
                  //
                  onTap: () async {
                    XFile? xfile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    Navigator.of(context).pop();
                    myfile = File(xfile!.path);
                    //setState(() {});
                  },
                  //
                  child: const Text(
                    "gallery",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onTapInkWellBottomSheet(var context) async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    // myfile = File(xfile!.path);

    update();
    //setState(() {});
  }

  //
//
//
}*/
