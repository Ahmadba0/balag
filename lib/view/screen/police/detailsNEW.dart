// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, file_names, prefer_const_constructors

import 'package:balag/linkApi.dart';
import 'package:balag/controller/police/detailsNEW_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TestNew extends StatefulWidget {
  const TestNew({super.key});

  @override
  State<TestNew> createState() => _TestNewState();
}

class _TestNewState extends State<TestNew> {
  @override
  Widget build(BuildContext context) {
    DetailsNEWController controller = Get.put(DetailsNEWController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 17, 68, 155),
          title: const Text(
            "التفاصيل",
            style: TextStyle(
                color: Color.fromARGB(255, 247, 237, 158),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 50,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 237, 158)),
        ),
        body: GetBuilder<DetailsNEWController>(
          builder: (controller) => Container(
            padding: EdgeInsets.all(10),

            //---decoration
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 50, 97, 177),
                    Color.fromARGB(255, 160, 193, 209),
                    Color.fromARGB(255, 113, 162, 187),
                  ]),
            ),
            child: controller.lottie == true
                ? Center(
                    child: Lottie.asset("assets/lottie/load2.json",
                        height: 200, width: 200),
                  )
                : ListView(
                    children: [
                      ...List.generate(
                        controller.detailsdata.length,
                        (index) => Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            controller.detailsdata[index]
                                        ['policeReport_image'] ==
                                    ''
                                ? Container()
                                : Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(
                                        "صور البلاغ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                    ],
                                  ),
                            controller.detailsdata[index]
                                        ['policeReport_image'] ==
                                    ''
                                ? Container()
                                : SizedBox(height: 8),
                            //row for image
                            controller.detailsdata[index]
                                        ['policeReport_image'] ==
                                    ''
                                ? Container()
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image']}"),
                                  ),
                            SizedBox(height: 10),
                            //--2
                            /* controller.detailsdata[index]
                                        ['policeReport_image2'] ==
                                    ''
                                ? Container()
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image2']}"),
                                  ),*/
                            //SizedBox(height: 10),
                            //--3
                            /*controller.detailsdata[index]
                                        ['policeReport_image3'] ==
                                    ''
                                ? Container()
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 247, 237, 158))),
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image3']}"),
                                  ),*/
                            // const SizedBox(height: 10),
                            //---body of report
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      child: Text(
                                        "نص البلاغ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 247, 237, 158))),
                                  child: Text(
                                    "${controller.detailsdata[index]['policeReport_body']}",
                                    style: TextStyle(
                                        color: Colors.blue[100], fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            //---time of report
                            Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      child: Text(
                                        "تاريخ تقديم البلاغ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 247, 237, 158))),
                                  child: Text(
                                    "${controller.detailsdata[index]['policeReport_time']}",
                                    style: TextStyle(
                                        color: Colors.blue[100], fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            //---icons depends on status
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      child: Text(
                                        "وضع البلاغ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 4, 45, 95),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 247, 237, 158))),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      controller.detailsdata[index]
                                                  ['policeReport_status'] ==
                                              0
                                          ? Text(
                                              "البلاغ لم يتم تسليمه بعد",
                                              style: TextStyle(
                                                  color: Colors.blue[100],
                                                  fontSize: 15),
                                            )
                                          : controller.detailsdata[index]
                                                      ['policeReport_status'] ==
                                                  1
                                              ? Text(
                                                  "لقد تم رؤية طلبك وهو في حالة المعالجة",
                                                  style: TextStyle(
                                                      color: Colors.blue[100],
                                                      fontSize: 15),
                                                )
                                              : Text(
                                                  "لقد تم معالجة طلبك ونرجو منك التقييم",
                                                  style: TextStyle(
                                                      color: Colors.blue[100],
                                                      fontSize: 15),
                                                ),
                                      Spacer(),
                                      Container(
                                        child: controller.detailsdata[index]
                                                    ['policeReport_status'] ==
                                                0
                                            ? Icon(
                                                Icons.done,
                                                color: Colors.blue[100],
                                              )
                                            : controller.detailsdata[index][
                                                        'policeReport_status'] ==
                                                    1
                                                ? Icon(
                                                    Icons.done_all,
                                                    color: Colors.blue[100],
                                                  )
                                                : Icon(
                                                    Icons.done_all,
                                                    color: Color.fromARGB(
                                                        255, 247, 237, 158),
                                                  ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            controller.replaytime == null
                                ? Container()
                                : Column(
                                    children: [
                                      Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Container(
                                            child: Text(
                                              "تاريخ الرد على البلاغ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 247, 237, 158)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 4, 45, 95),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 247, 237, 158))),
                                        child: Text(
                                          "${controller.replaytime}",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),

                      //replay
                      ...List.generate(
                        controller.replaydata.length,
                        (index) => Container(
                          child: Column(
                            children: const [
                              SizedBox(height: 10),
                              //---text of replay
                              /* Container(
                                child: Text(
                                    "${controller.replaydata[index]['policereplay_text']}"),
                              ),*/
                              //---time for replay
                              /*  Container(
                                child: Text(
                                    "${controller.replaydata[index]['policereplay_time']}"),
                              ),*/
                            ],
                          ),
                        ),
                      ),
                      //---when get rating and not found value :
                      //1
                      controller.getratingvalue == null
                          ? Column(
                              children: [
                                //---when status = 2
                                controller.status == 2
                                    ? Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 19),
                                            child: Row(
                                              children: [
                                                //1
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.onestar();
                                                  },
                                                  child: Icon(
                                                    controller.rating >= 1
                                                        ? Icons.star
                                                        : Icons.star_border,
                                                    size: 25,
                                                    color: Color.fromARGB(
                                                        255, 247, 237, 158),
                                                  ),
                                                ),
                                                //2
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.twostar();
                                                  },
                                                  child: Icon(
                                                    controller.rating >= 2
                                                        ? Icons.star
                                                        : Icons.star_border,
                                                    size: 25,
                                                    color: Color.fromARGB(
                                                        255, 247, 237, 158),
                                                  ),
                                                ),
                                                //3
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.threestar();
                                                  },
                                                  child: Icon(
                                                      controller.rating >= 3
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      size: 25,
                                                      color: Color.fromARGB(
                                                          255, 247, 237, 158)),
                                                ),
                                                //4
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.fourstar();
                                                  },
                                                  child: Icon(
                                                      controller.rating >= 4
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      size: 25,
                                                      color: Color.fromARGB(
                                                          255, 247, 237, 158)),
                                                ),
                                                //5
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.fivestar();
                                                  },
                                                  child: Icon(
                                                      controller.rating >= 5
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      size: 25,
                                                      color: Color.fromARGB(
                                                          255, 247, 237, 158)),
                                                ),
                                                //
                                                const Spacer(),
                                                //---text أضف تقييمك
                                                const Text(
                                                  "أضف تقييمك",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 247, 237, 158),
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),

                                          //--- drop down button to add period
                                          SizedBox(height: 8),
                                          Container(
                                            //
                                            height: 50,
                                            margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            alignment: Alignment.bottomLeft,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 90),
                                            /* padding: EdgeInsets.symmetric(
                                                horizontal: 70),*/
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromARGB(
                                                      255, 247, 237, 158)),
                                              color: Color.fromARGB(
                                                  255, 4, 45, 95),
                                            ),
                                            child: Center(
                                              child: DropdownButtonFormField(
                                                alignment: Alignment.center,
                                                /*  padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 70),*/
                                                hint: Text(
                                                  "مدة الاستجابة",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.blue[100]),
                                                ),
                                                items: controller.day
                                                    .map((e) => DropdownMenuItem(

                                                        // ignore: sort_child_properties_last
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            e,
                                                            style: TextStyle(
                                                                /*  fontSize:
                                                                        12,*/
                                                                color: Colors
                                                                    .blue[100]),
                                                          ),
                                                        ),
                                                        value: e))
                                                    .toList(),
                                                onChanged: (value) {
                                                  controller.changeday(value);
                                                },
                                                value: controller.newday,
                                                icon: Icon(
                                                  Icons.location_city_outlined,
                                                  color: Colors.blue[100],
                                                ),
                                                dropdownColor: Color.fromARGB(
                                                    255, 4, 45, 95),
                                              ),
                                            ),
                                          ),
                                          //---elevated button for add rating
                                          SizedBox(height: 8),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 35,
                                                                right: 35),
                                                        primary: Color.fromARGB(
                                                            255, 4, 45, 95),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35),
                                                            side: BorderSide(
                                                                color:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        247,
                                                                        237,
                                                                        158)))),
                                                    onPressed: () async {
                                                      controller.addRating();
                                                      await controller
                                                          .getrating();
                                                      controller
                                                          .refreshDetails();
                                                    },
                                                    child: Text(
                                                      "إضافة التقييم",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              247,
                                                              237,
                                                              158)),
                                                    )),
                                                ////
                                                ///
                                                //
                                                Spacer(),
                                                controller.status == 2
                                                    ? ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 65,
                                                                    right: 65),
                                                            primary: Color.fromARGB(
                                                                255, 4, 45, 95),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35),
                                                                side: BorderSide(
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        247,
                                                                        237,
                                                                        158)))),
                                                        onPressed: () {
                                                          Get.defaultDialog(
                                                              title:
                                                                  "هل أنت متأكد من حذف البلاغ",
                                                              content: Text(""),
                                                              actions: [
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                        "لا")),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .delete();
                                                                    },
                                                                    child: Text(
                                                                        "نعم")),
                                                              ]);
                                                        },
                                                        child: Text(
                                                          "X",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .red[800]),
                                                        ))
                                                    : Container()
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : Container(),
                                /*controller.status == 2
                          ? ElevatedButton(
                              onPressed: () {
                                controller.addRating();
                                controller.getrating();
                                controller.refreshDetails();
                              },
                              child: Text("add rating"))
                          : Container()*/
                              ],
                            )
                          //---2
                          //next part if getrating and found value
                          : Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      //1
                                      GestureDetector(
                                        onTap: () {
                                          // controller.onestar();
                                        },
                                        child: Icon(
                                            controller.getratingvalue >= 1
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                      //2
                                      GestureDetector(
                                        onTap: () {
                                          //controller.twostar();
                                        },
                                        child: Icon(
                                            controller.getratingvalue >= 2
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                      //3
                                      GestureDetector(
                                        onTap: () {
                                          // controller.threestar();
                                        },
                                        child: Icon(
                                            controller.getratingvalue >= 3
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                      //4
                                      GestureDetector(
                                        onTap: () {
                                          //  controller.fourstar();
                                        },
                                        child: Icon(
                                            controller.getratingvalue >= 4
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                      //5
                                      GestureDetector(
                                        onTap: () {
                                          //controller.fivestar();
                                        },
                                        child: Icon(
                                            controller.getratingvalue >= 5
                                                ? Icons.star
                                                : Icons.star_border,
                                            size: 25,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      ),
                                      //
                                      const Spacer(),
                                      const Text(
                                        " تقييمك",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 247, 237, 158)),
                                      )
                                    ],
                                  ),
                                ),
                                //---rating period
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: const [
                                          Text("مدة الاستجابة",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 247, 237, 158))),
                                          //Spacer(),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        padding: EdgeInsets.only(
                                            left: 30, right: 20),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 4, 45, 95),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 247, 237, 158))),
                                        child: Text(
                                          "${controller.getratingday}",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 18),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            left: 65, right: 65),
                                        primary: Color.fromARGB(255, 4, 45, 95),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 247, 237, 158)))),
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "هل أنت متأكد من حذف البلاغ",
                                          content: Text(""),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text("لا")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  controller.delete();
                                                },
                                                child: Text("نعم")),
                                          ]);
                                      // controller.delete();
                                    },
                                    child: Text(
                                      "X",
                                      style: TextStyle(color: Colors.red[800]),
                                    ))
                              ],
                            ),
                      //---for delete
                      /*  controller.status == 2
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(left: 35, right: 35),
                                  primary: Color.fromARGB(255, 4, 45, 95),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 247, 237, 158)))),
                              onPressed: () {
                                controller.delete();
                              },
                              child: Text(
                                "X",
                                style: TextStyle(color: Colors.red[800]),
                              ))
                          : Container()*/
                    ],
                  ),
          ),
        ));
  }
}
