// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, file_names, unused_local_variable

import 'dart:async';

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:get/get.dart';

class DetailsNEWController extends GetxController {
  Curd crud = Curd();
  MyServices myServices = Get.find();
  List detailsdata = [];
  List replaydata = [];
  List ratingdata = [];
  bool isloading = false;
  var palagid;
  var status;
  int rating = 0;
  var img1;
  var img2;
  var img3;
  var getratingvalue;
  var getratingday;
  String? newday;
  List day = [
    "يوم واحد",
    "يومين",
    "ثلاثة أيام",
    "اربعة ايام",
    "خمسة ايام",
    "اكثر من ذلك"
  ];

  getReportDeatils() async {
    detailsdata.clear();
    isloading = true;
    update();
    var response = await crud
        .postRequesrt(linkApi.details, {'report_id': palagid.toString()});
    isloading = false;
    if (response['status'] == "sucsses") {
      detailsdata.addAll(response['data']);
      status = detailsdata[0]['policeReport_status'];
      img1 = detailsdata[0]['policeReport_image'];
      img2 = detailsdata[0]['policeReport_image2'];
      img3 = detailsdata[0]['policeReport_image3'];
      print("---status: $status");
    }
    update();
    return response;
  }

  var replaytext;
  var replaytime;
  getReplay() async {
    replaydata.clear();
    var response = await crud.postRequesrt(
        linkApi.viewReplay, {'policereplay_report': palagid.toString()});
    print(response);
    if (response['status'] == "sucsses") {
      replaydata.addAll(response['data']);
      replaytext = replaydata[0]['policereplay_text'];
      replaytime = replaydata[0]['policereplay_time'];
      update();
    }

    return response;
  }

  refreshDetails() {
    print("-----------refresh details");
    getReportDeatils();
    getReplay();
    getrating();
    update();
  }

  onestar() {
    //rating = 1;
    if (rating == 0) {
      rating = 1;
    } else {
      rating = 0;
    }
    update();
    print("rating $rating");
  }

  twostar() {
    rating = 2;
    update();
    print("rating $rating");
  }

  threestar() {
    rating = 3;
    update();
    print("rating $rating");
  }

  fourstar() {
    rating = 4;
    update();
    print("rating $rating");
  }

  fivestar() {
    rating = 5;
    update();
    print("rating $rating");
  }

  addRating() async {
    if (newday != null) {
      var response = await crud.postRequesrt(linkApi.addrating, {
        "rating_value": rating.toString(),
        "rating_period": newday,
        "rating_userid": myServices.sharedPref.getString("id").toString(),
        "rating_reportid": palagid.toString(),
      });
      if (response['status'] == 'success') {
        Get.snackbar("", "شكراً لك على تقييمك لنا",
            duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar("تنبيه", "يرجى تحديد مدة الاستجابة");
    }
  }

  getrating() async {
    var response = await crud.postRequesrt(linkApi.getrating, {
      "rating_reportid": palagid.toString(),
    });
    if (response['status'] == 'sucsses') {
      ratingdata.addAll(response['data']);
      getratingvalue = ratingdata[0]['rating_value'];
      getratingday = ratingdata[0]['rating_period'];
      print("---rating value : $getratingvalue");
      update();
    } else {
      print("no rating yet");
    }
    return response;
  }

  changeday(var day) {
    newday = null;
    newday = day;
    print("new day $newday");
    update();
  }

  delete() async {
    print("delete1");
    var respons = await crud.postRequesrt(linkApi.delete, {
      "report_id": palagid.toString(),
      "imagename": img1,
      //"imagename1": img2,
      //"imagename2": img3,
    });
    print("delete2");
    if (img2 != null) {
      deleteimg2();
    }
    if (img3 != null) {
      deleteimg3();
    }
    if (respons["status"] == "sucsses") {
      print("delete3");
      //controller.getReport();
      Get.offAll(Home());
      update();
    }
  }

  deleteimg2() async {
    var respons = await crud.postRequesrt(linkApi.deleteimg2, {
      "report_id": palagid.toString(),
      "imagename": img2,
      //"imagename1": img2,
      //"imagename2": img3,
    });
  }

  deleteimg3() async {
    var respons = await crud.postRequesrt(linkApi.deleteimg3, {
      "report_id": palagid.toString(),
      "imagename": img3,
      //"imagename1": img2,
      //"imagename2": img3,
    });
  }

  bool lottie = true;

  @override
  void onInit() {
    palagid = Get.arguments['palagId'];
    print("--palagid : $palagid");
    getReportDeatils();
    //getReplay();
    getrating();
    Timer(Duration(seconds: 3), () {
      lottie = false;
      update();
      print(lottie);
    });
    super.onInit();
  }
}
