/*import 'dart:io';

import 'package:balag/controller/addPalagPolice_controller.dart';
import 'package:balag/view/screen/addbalagPolice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomAddImagePolice extends StatelessWidget {
  final void Function() onPressed;
  const CustomAddImagePolice({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AddPalagPoliceController controller = Get.put(AddPalagPoliceController());
    return Container(
      margin: const EdgeInsets.all(5),
      height: 120,
      width: 112,
      decoration: BoxDecoration(color: Colors.grey[300]),
      //
      //
      child: Center(
        child: IconButton(
            //
            //
            onPressed: onPressed,
            icon: const Icon(
              Icons.add_a_photo_outlined,
              color: Color.fromARGB(255, 4, 54, 95),
            )),
      ),
    );
  }
}
*/

/*

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            width: Get.width * 0.75,
                            height: Get.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color.fromARGB(255, 4, 45, 95),
                            ),
                            child: const Text(
                              "choose image : ",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
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
                            //
                            onTap: () async {
                              XFile? xfile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              Navigator.of(context).pop();
                              controller.myfile == null
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
                             controller.myfile = File(xfile!.path);
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
            }*/