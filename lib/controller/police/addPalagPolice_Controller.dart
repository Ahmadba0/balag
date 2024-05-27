// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, file_names

import 'dart:async';
import 'dart:io';
import 'package:balag/view/screen/home.dart';
import 'package:balag/view/screen/police/PolicePage.dart';
import 'package:balag/view/screen/police/testAddPalagPolice.dart';
import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddPalagPoliceController extends GetxController {
  //var
  bool loc = false;

  File? myfile;
  File? myfile2;
  File? myfile3;
  bool press2 = false;
  bool press3 = false;
  Position? currentPosition;
  var currentAddress;
  bool isLoading = false;
  TextEditingController? body;
  TextEditingController? moreInformationController;
  GlobalKey<FormState> formState = GlobalKey();
  MyServices myServices = Get.find();
  Curd curd = Curd();
  int count = 0;
  //drop down location
  List items1 = [
    "دمشق",
    "ريف دمشق",
    "حمص",
    "حلب",
    "اللاذقية",
    "طرطوس",
    "حماة",
    "ادلب",
    "درعا"
  ];
  List damas = [
    "الصالحية",
    "الحمراء",
    "باب توما",
    "المزة",
    "الحميدية",
    "البرامكة",
    "ركن الدين"
  ];
  List refDamas = [
    "يبرود",
    "النبك",
    "القطيفة",
    "دير عطية",
    "الزبداني",
    "القسطل",
    "قارة",
    "جيرود"
  ];
  List homs = [
    "الدبلان",
    "الحضارة",
    "القصير",
    "باب عمرو",
    "باب سبيع",
    "باب دريب",
    "عكرمة"
  ];
  var selectedCity;
  //var selectedRegion;
  bool showHandLocation = false;

  changeHandLocation() {
    if (showHandLocation == false) {
      showHandLocation = true;
      print(showHandLocation);
      update();
    } else {
      showHandLocation = false;
      print(showHandLocation);
      update();
    }
  }

  changeCity(var city) {
    selectedCity = null;
    selectedCity = city;
    currentAddress = null;
    print(selectedCity);
    update();
  }

  changeRegion(var region) {
    currentAddress = region;
    print(currentAddress);
    update();
  }

  //السماحية
  Future getPosition() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    print("$services");
    print("==================");
    /* if (services == false) {
      AwesomeDialog(context: context, title: "aa", body: Text("not enable"))
        ..show();
    }*/
    LocationPermission per;
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLong();
      }
    }
  }

  //lat anf long
  getLatAndLong() async {
    print("==================");
    print("getLatAndLong");

    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  //lat and lang
  getCurrentLocation() {
    print("==================");
    print("getCurrentLocation");
    isLoading = true;
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      update();
      print(position.latitude);
      print(position.longitude);
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
    isLoading = false;
  }

  //current address
  getAddressFromLatLng() async {
    print("==================");
    print("getAddressFromLatLng");
    isLoading = true;
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      Placemark place = p[0];

      currentAddress = "${place.locality}";
      print("currentAddress $currentAddress");
      update();
    } catch (e) {
      print(e);
    }
    isLoading = false;
  }

  var s;
  addPoliceReport() async {
    print("1");
    if (myfile == null) {
      if (formState.currentState!.validate() && currentAddress != null) {
        /* print("2");
      Get.back();
      Get.snackbar("تنبيه", "يجب عليك اختيار صورة واحدة على الأقل",
          duration: const Duration(seconds: 2),
          icon: const Icon(
            Icons.warning_amber_sharp,
            color: Colors.red,
          ));*/
        print("4");
        var response =
            await curd.postRequesrt(linkApi.addPoliceReportwithoutimg, {
          "policeReport_body": body!.text,
          "policeReport_location": currentAddress,
          "policeReport_moreInformation": moreInformationController!.text,
          "policeReport_type": "police",
          "policeReport_user": myServices.sharedPref.getString("id").toString()
        });
        s = body!.text;
        print("5");
        //  await addPoliceReportimg2();
        if (response["status"] == "success") {
          //Get.off(() => PolicePage());
          Get.offAll(() => const Home());
          Timer(Duration(seconds: 1), () {
            Get.to(() => const PolicePage());
            update();
            print(lottie);
          });
        }
      } else if (currentAddress == null) {
        Get.back();
        Get.snackbar("تنبيه", "يرجى تحديد موقع البلاغ الحالي",
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.warning_amber_sharp,
              color: Colors.red,
            ));
      } else {
        Get.back();
      }
    } else {
      print("3");

      if (formState.currentState!.validate() && currentAddress != null) {
        print("4");
        var response = await postRequsetWithFile(
            linkApi.addPoliceReport,
            {
              "policeReport_body": body!.text,
              "policeReport_location": currentAddress,
              "policeReport_moreInformation": moreInformationController!.text,
              "policeReport_type": "police",
              "policeReport_user":
                  myServices.sharedPref.getString("id").toString()
            },
            myfile!);
        s = body!.text;
        print("5");
        //  await addPoliceReportimg2();
        if (response["status"] == "success") {
          //Get.off(() => PolicePage());
          Get.offAll(() => const Home());
          Timer(Duration(seconds: 1), () {
            Get.to(() => const PolicePage());
            update();
            print(lottie);
          });
        }
      } else if (currentAddress == null) {
        Get.back();
        Get.snackbar("تنبيه", "يرجى تحديد موقع البلاغ الحالي",
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.warning_amber_sharp,
              color: Colors.red,
            ));
      } else {
        Get.back();
      }
    }
  }

  addPoliceReportimg2() async {
    if (press2 == true) {
      print("----------press2---------");

      var response = await postRequsetWithFile(
          linkApi.addImageTwoToReport,
          {
            "policeReport_body": s,
          },
          myfile2!);
      print("------------22");
      if (response["status"] == "success") {
        //  addPoliceReportimg();
        print("----------image2---------");
      }
    } else {
      //Get.snackbar("تنبيه", "يجب اختيار صورة على الأقل");
      //Get.back();
      print("qqqqqqqqqqq");
      print("---not true-----");
    }
  }

  addPoliceReportimg3() async {
    if (press3 == true) {
      print("----------press3---------");

      var response = await postRequsetWithFile(
          linkApi.addImageThreeToReport,
          {
            "policeReport_body": s,
          },
          myfile3!);
      print("------------3");
      if (response["status"] == "success") {
        //  addPoliceReportimg();
        print("----------image3---------");
      }
    } else {
      print("---not true-----");
    }
  }

  addImageCamera() async {
    if (count == 0) {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile = File(xfile.path);
      } else {}
      //myfile = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile);
      xfile != null ? count = 1 : count = 0;
      print(count);
      //setState(() {});
    } else if (count == 1) {
      press2 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile2 = File(xfile.path);
      } else {}
      //myfile2 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile2);
      xfile != null ? count = 2 : count = 1;
      print(count);
      //setState(() {});
    } else if (count == 2) {
      press3 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile3 = File(xfile.path);
      } else {}
      //myfile3 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile3);
      xfile != null ? count = 3 : count = 2;
      print(count);
      //setState(() {});
    }
  }

  addImageGallery() async {
    if (count == 0) {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile = File(xfile.path);
      } else {}
      //myfile = File(xfile!.path);

      update();
      //setState(() {});
      print(myfile);
      xfile != null ? count = 1 : count = 0;
      print(count);
      //setState(() {});
    } else if (count == 1) {
      press2 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile2 = File(xfile.path);
      } else {}
      //myfile2 = File(xfile!.path);
      update();
      //setState(() {});
      print(myfile2);
      xfile != null ? count = 2 : count = 1;
      print(count);
      //setState(() {});
    } else if (count == 2) {
      press3 = true;
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      Get.to(() => const Test());
      print(xfile);
      if (xfile != null) {
        myfile3 = File(xfile.path);
      } else {}
      //myfile3 = File(xfile!.path);
      update();
      print(myfile3);
      xfile != null ? count = 3 : count = 2;
      print(count);
    }
  }

  locationButton() {
    isLoading == true
        ? Lottie.asset("assets/lottie/load1.json")
        : getCurrentLocation();
  }

  bool moreInformation = false;
  //قيمة تتغير مشان يعرض حقل  ونكتب معلومات اضافية
  changeMoreInformation() {
    if (moreInformation == false) {
      moreInformation = true;
      update();
    } else {
      moreInformation = false;
      update();
    }
    update();
    print("moreInformation $moreInformation");
    return moreInformation;
  }

  //On
  bool lottie = true;
  @override
  void onInit() {
    getPosition();
    body = TextEditingController();
    moreInformationController = TextEditingController();
    Timer(const Duration(seconds: 2), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}


  //end drop down location

  //method
/*
  ontapOnInkWellInBottonSheetCamera(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile = File(xfile!.path);
    update();
    print(myfile);
    //setState(() {});
  }
*/ /*
  ontapOnInkWellInBottonSheetCamera2(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile2 = File(xfile!.path);
    update();
    print(myfile2);
    //setState(() {});
  }
*/ /*
  ontapOnInkWellInBottonSheetCamera3(var context) async {
    /*XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Navigator.of(context).pop();
    Get.back();
    //myfile == null ? Get.to(AddBalagPolice()) : File(xfile!.path);
    if (xfile != null) {
      myfile = File(xfile.path);
    } else {}

    //myfile = File(xfile!.path);
    //setState(() {});
    update();*/

    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    //Get.back();
    print(xfile);
    myfile3 = File(xfile!.path);
    update();
    print(myfile3);
    //setState(() {});
  }
*/
/////should repeat
  /*
  ontapOnInkWellInBottonSheetGallery() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Navigator.of(context).pop();
    Get.back();
    myfile == null ? Get.to(const AddBalagPolice()) : File(xfile!.path);
    // setState(() {});
    update();
  }
*/ /*
  onpressoniconcamera(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/ /*
  onpressoniconcamera2(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera2(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/ /*
  onpressoniconcamera3(var context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTitleInButtomSheet(text: "Choose Image"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetCamera3(context);
                  },
                  text: "camera"),
              const SizedBox(height: 10),
              CustomInkWellInButtomSheet(
                  onTap: () {
                    ontapOnInkWellInBottonSheetGallery();
                  },
                  text: "gallery"),
            ],
          ),
        );
      },
    );
  }
*/