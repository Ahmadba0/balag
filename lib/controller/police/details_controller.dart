// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, avoid_print

import 'package:balag/core/classes/crud.dart';
import 'package:balag/core/services/servises.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/screen/home.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var palagId;
  int rating = 0;
  Curd crud = Curd();
  MyServices myServices = Get.find();
  int status = 0;
  var notifiHelper;
  bool isloading = false;
  var img1;
  var img2;
  var img3;
  String? newday;
  List data = [];
  List datareport = [];

  List day = [
    "يوم واحد",
    "يومين",
    "ثلاثة أيام",
    "اربعة ايام",
    "خمسة ايام",
    "اكثر من ذلك"
  ];

  changeday(var day) {
    newday = null;
    newday = day;
    print("new day $newday");
    update();
  }

  getReportDeatils() async {
    datareport.clear();
    isloading = true;
    update();
    var response = await crud
        .postRequesrt(linkApi.details, {'report_id': palagId.toString()});
    isloading = false;
    print(response);
    if (response['status'] == "sucsses") {
      datareport.addAll(response['data']);
      status = datareport[0]['policeReport_status'];
      print("---status---$status-----");
    }
    update();
    return response;
  }

  refreshDetails() {
    print("-----------refresh details");
    getReportDeatils();
    update();
  }

  getReplay() async {
    // if (status == 2) {
    //data.clear();
    var response = await crud.postRequesrt(
        linkApi.viewReplay, {'policereplay_report': palagId.toString()});
    print("------getreplay--------");
    print(response);
    if (response['status'] == "sucsses") {
      print("------suu");
      data.addAll(response['data']);
      update();
      print("--------------");
      print(data.toList());
      var policereplayText = data[0]["policereplay_text"];
      var policereplayId = data[0]["policereplay_id"];
      var policereplayTime = data[0]['policereplay_time'];
      print("----$policereplayTime-----");
    }
    print(response);
    return response;
    /*} else {
      print("we are in get replay but status less than 2");
    }*/
  }

  delete() async {
    print("delete1");
    var respons = await crud.postRequesrt(linkApi.delete, {
      "report_id": palagId.toString(),
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
      "report_id": palagId.toString(),
      "imagename": img2,
      //"imagename1": img2,
      //"imagename2": img3,
    });
  }

  deleteimg3() async {
    var respons = await crud.postRequesrt(linkApi.deleteimg3, {
      "report_id": palagId.toString(),
      "imagename": img3,
      //"imagename1": img2,
      //"imagename2": img3,
    });
  }

  onestar() {
    rating = 1;
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

  //rating
  bool ratingupload = false;

  addRating() async {
    ratingupload = true;
    var response = await crud.postRequesrt(linkApi.addrating, {
      "rating_value": rating.toString(),
      "rating_period": newday,
      "rating_userid": myServices.sharedPref.getString("id").toString(),
      "rating_reportid": palagId.toString(),
    });
    if (response['status'] == 'success') {
      Get.snackbar("", "شكراً لك على تقييمك لنا");
    }
  }

  List ratingdata = [];
  var ratingid;
  var ratingv;

  getrating() async {
    print("----get rating");
    if (ratingid == null) {
      //ratingdata.clear();
      var resonse = await crud.postRequesrt(linkApi.getrating, {
        "rating_reportid": palagId.toString(),
      });
      if (resonse['status'] == 'sucsses') {
        ratingdata.addAll(resonse['data']);
        rating = ratingdata[0]['rating_value'];
        newday = ratingdata[0]['rating_period'];
        ratingid = ratingdata[0]['rating_id'];
        print("rating value $rating");
        print("rating period $newday");
        print("rating id $ratingid");
      } else {
        print("no rating yet");
      }
      // update();
    }
  }

//ميثود لاختبار حالة الطلب اذا كان اكبر من اثنين سوف ينفذ  عملية احضار التقييم
  testToDo() {
    print("test to do");
    if (status == 2) {
      getrating();
    }
    update();
  }

  @override
  void onInit() {
    palagId = Get.arguments['palagId'];
    print("-----get----$palagId");
    getReportDeatils();
    getReplay();
    getrating();
    //testToDo();
    super.onInit();
  }
}
