// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:async';

import 'package:balag/controller/profile_controller.dart';
import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:balag/view/screen/profile/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCity extends StatefulWidget {
  const UpdateCity({super.key});

  @override
  State<UpdateCity> createState() => _UpdateCityState();
}

class _UpdateCityState extends State<UpdateCity> {
  ProfileController controller = Get.put(ProfileController());
  List cities = ["ريف دمشق", "دمشق", "حمص"];
  List damas = ["الصالحية", "الحمراء", "باب توما"];
  List refDamas = ["يبرود", "النبك", "القطيفة"];
  List homs = ["الدبلان", "الحضارة"];
  var newCity;
  bool isloading = false;
  Curd curd = Curd();
  MyServices myServices = Get.find();
  var city;
  var newRegion;
  var region;
//method
//
  @override
  void initState() {
    super.initState();
    city = Get.arguments['city'];
    region = Get.arguments['region'];
  }

  updatecityy() async {
    isloading = true;
    setState(() {});
    var response = await curd.postRequesrt(linkApi.updatecity, {
      "usersid": myServices.sharedPref.getString("id"),
      "users_city": newCity,
      "users_region": newRegion,
    });
    if (response['status'] == 'sucsses') {
      isloading = false;
      Get.offAll(const Home());
      Timer(const Duration(seconds: 1), () {
        Get.to(() => const ProfilePage());
      });
      //
      //myServices.sharedPref.setString("phone", phoneController.text).toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "تعديل الموقع",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 237, 158),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 50,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 15),
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
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  "اختر المحافظة الجديدة",
                  style: TextStyle(
                      color: Color.fromARGB(255, 247, 237, 158), fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              //  padding: EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 247, 237, 158),
                      width: 2),
                  color: const Color.fromARGB(255, 4, 45, 95),
                  borderRadius: BorderRadius.circular(25)),
              child: DropdownButton(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 70),
                hint: Text(
                  city,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 167, 196, 230)),
                ),
                items: cities
                    .map((e) => DropdownMenuItem(

                        // ignore: sort_child_properties_last
                        child: Container(
                          alignment: Alignment.center,
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
                onChanged: (value) {
                  newRegion = null;
                  newCity = value;
                  setState(() {});
                },
                value: newCity,
                dropdownColor: const Color.fromARGB(255, 4, 54, 95),
                isExpanded: false,
                icon: const Icon(Icons.location_city_outlined),
                iconEnabledColor: const Color.fromARGB(255, 247, 237, 158),
              ),
            ),
            const SizedBox(height: 15),
            newCity == null
                ? Container()
                : newCity == "ريف دمشق"
                    ? Column(
                        children: [
                          const Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "اختر المحافظة الجديدة",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 247, 237, 158),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            //  padding: EdgeInsets.symmetric(horizontal: 70),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 247, 237, 158),
                                    width: 2),
                                color: const Color.fromARGB(255, 4, 45, 95),
                                borderRadius: BorderRadius.circular(25)),
                            child: DropdownButton(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              hint: Text(
                                region,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 167, 196, 230)),
                              ),
                              items: refDamas
                                  .map((e) => DropdownMenuItem(

                                      // ignore: sort_child_properties_last
                                      child: Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              // height: 0,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 167, 196, 230)),
                                        ),
                                      ),
                                      value: e))
                                  .toList(),
                              onChanged: (value) {
                                newRegion = value;
                                setState(() {});
                              },
                              value: newRegion,
                              dropdownColor:
                                  const Color.fromARGB(255, 4, 54, 95),
                              isExpanded: false,
                              icon: const Icon(Icons.location_city_outlined),
                              iconEnabledColor:
                                  const Color.fromARGB(255, 247, 237, 158),
                            ),
                          ),
                        ],
                      )
                    : newCity == "دمشق"
                        ? Column(
                            children: [
                              const Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    "اختر المحافظة الجديدة",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 247, 237, 158),
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 247, 237, 158),
                                        width: 2),
                                    color: const Color.fromARGB(255, 4, 45, 95),
                                    borderRadius: BorderRadius.circular(25)),
                                child: DropdownButton(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70),
                                  hint: Text(
                                    region,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 167, 196, 230)),
                                  ),
                                  items: damas
                                      .map((e) => DropdownMenuItem(

                                          // ignore: sort_child_properties_last
                                          child: Center(
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  // height: 0,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 167, 196, 230)),
                                            ),
                                          ),
                                          value: e))
                                      .toList(),
                                  onChanged: (value) {
                                    newRegion = value;
                                    setState(() {});
                                  },
                                  value: newRegion,
                                  dropdownColor:
                                      const Color.fromARGB(255, 4, 54, 95),
                                  isExpanded: false,
                                  icon:
                                      const Icon(Icons.location_city_outlined),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 247, 237, 158),
                                ),
                              ),
                            ],
                          )
                        : newCity == "حمص"
                            ? Column(
                                children: [
                                  const Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        "اختر المحافظة الجديدة",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158),
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27),
                                    //  padding: EdgeInsets.symmetric(horizontal: 70),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 247, 237, 158),
                                            width: 2),
                                        color: const Color.fromARGB(
                                            255, 4, 45, 95),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: DropdownButton(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70),
                                      hint: Text(
                                        region,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 167, 196, 230)),
                                      ),
                                      items: homs
                                          .map((e) => DropdownMenuItem(

                                              // ignore: sort_child_properties_last
                                              child: Center(
                                                child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      // height: 0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 167, 196, 230)),
                                                ),
                                              ),
                                              value: e))
                                          .toList(),
                                      onChanged: (value) {
                                        newRegion = value;
                                        setState(() {});
                                      },
                                      value: newRegion,
                                      dropdownColor:
                                          const Color.fromARGB(255, 4, 54, 95),
                                      isExpanded: false,
                                      icon: const Icon(
                                          Icons.location_city_outlined),
                                      iconEnabledColor: const Color.fromARGB(
                                          255, 247, 237, 158),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
            const SizedBox(height: 75),
            newRegion == null
                ? Container()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 247, 237, 158),
                            width: 1.5),
                        primary: const Color.fromARGB(255, 4, 45, 95),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 90)),
                    onPressed: () {
                      Get.defaultDialog(
                          backgroundColor: Colors.blue[100],
                          titleStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 45, 95)),
                          title: "تأكيد تغير الموقع",
                          content: const Text(""),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 4, 45, 95),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 247, 237, 158))),
                                onPressed: () => Get.back(),
                                child: Text(
                                  "لا",
                                  style: TextStyle(color: Colors.blue[100]),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 4, 45, 95),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 247, 237, 158))),
                                onPressed: () => updatecityy(),
                                child: Text("نعم",
                                    style: TextStyle(color: Colors.blue[100]))),
                          ]);
                    },
                    child: const Text(
                      "تعديل",
                      style:
                          TextStyle(color: Color.fromARGB(255, 247, 237, 158)),
                    ))
          ],
        ),
      ),
    );
  }
}
