// ignore_for_file: sized_box_for_whitespace, file_names, avoid_unnecessary_containers

import 'package:balag/controller/profile_controller.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/profile/UpdatePhone.dart';
import 'package:balag/view/screen/profile/updateCity.dart';
import 'package:balag/view/widget/widgetProfile/customText.dart';
import 'package:balag/view/widget/widgetProfile/customtextwithEdit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "الصفحة الشخصية",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 50, 97, 177),
                      Color.fromARGB(255, 160, 193, 209),
                      Color.fromARGB(255, 113, 162, 187),
                      Color.fromARGB(255, 50, 97, 177),
                    ]),
                border: Border(
                    top: BorderSide(
                        width: 2, color: Color.fromARGB(255, 247, 237, 158)))),
            child: controller.lottie == true
                ? Center(
                    child: Lottie.asset("assets/lottie/load2.json",
                        width: 150, height: 150),
                  )
                : ListView(
                    children: [
                      //const CustomStackImage(),

                      const SizedBox(height: 15),
                      ...List.generate(
                        controller.users.length,
                        (index) => Column(
                          children: [
                            ////
                            ///
                            const SizedBox(height: 8),
                            controller.ll == true
                                ? Center(
                                    child: Lottie.asset(
                                        "assets/lottie/load2.json",
                                        height: 125,
                                        width: 125))
                                : Container(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        "${controller.users[index]['users_image']}" !=
                                                ''
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2,
                                                        color: const Color
                                                                .fromARGB(255,
                                                            247, 237, 158)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            75)),
                                                child: CircleAvatar(
                                                  radius: 75,
                                                  backgroundImage: NetworkImage(
                                                      "${linkApi.linkImage}/${controller.img}"),
                                                ),
                                              )
                                            : const CircleAvatar(
                                                radius: 75,
                                                backgroundImage: AssetImage(
                                                    "assets/image/no.png"),

                                                //FileImage(controller.myfile!)
                                              ),
                                        Positioned(
                                            left: 95,
                                            top: 120,
                                            child: IconButton(
                                                onPressed: () {
                                                  controller.addImageGallery();
                                                },
                                                icon: const Icon(
                                                  Icons.camera_alt,
                                                  size: 30,
                                                  color: Color.fromARGB(
                                                      255, 4, 45, 95),
                                                )))
                                      ],
                                    ),
                                  ),
                            SizedBox(height: 20),

                            ///
                            ///
                            CustomText(
                                text:
                                    "${controller.users[index]['users_name']}"),
                            const SizedBox(height: 8),
                            CustomText(
                                text:
                                    "${controller.users[index]['users_number']}"),
                            const SizedBox(height: 8),
                            CustomTextWithEdit(
                              text: "${controller.users[index]['users_phone']}",
                              onPressed: () {
                                Get.to(const UpdatePhone(), arguments: {
                                  "id": controller.users[index]["users_id"],
                                  "phone": controller.users[index]
                                      ['users_phone'],
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextWithEdit(
                              text:
                                  "${controller.users[index]['users_city']} / ${controller.users[index]['users_region']}",
                              onPressed: () {
                                Get.to(const UpdateCity(), arguments: {
                                  "city": controller.users[index]['users_city'],
                                  "region": controller.users[index]
                                      ['users_region'],
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
/*

padding: const EdgeInsets.all(5),
                  child: ListView(children: [
                    const CustomStackImage(),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomText(text: "${controller.users[0]['users_name']}"),
                    const SizedBox(height: 20),
                    CustomText(text: "${controller.users[0]['users_number']}"),
                    const SizedBox(height: 20),
                    CustomTextWithEdit(
                        text: "${controller.users[0]['users_phone']}",
                        onPressed: () {
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
                        }),
                    const SizedBox(height: 20),
                    CustomTextWithEdit(
                      text: "${controller.users[0]['users_city']}",
                      onPressed: () {
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
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextWithEdit(
                      text: "${controller.users[0]['users_region']}",
                      onPressed: () {
                        Get.defaultDialog(
                            title: "تعديل",
                            content: Form(
                                child: TextFormField(
                                    //controller: controller.users[0]['users_region'],
                                    )),
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
                      },
                    ),
                    const SizedBox(height: 20)
                  ]),

                  */