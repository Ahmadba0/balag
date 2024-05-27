// ignore_for_file: sized_box_for_whitespace, unused_local_variable, avoid_unnecessary_containers, avoid_print, file_names
/*
import 'package:balag/controller/details_controller.dart';
import 'package:balag/core/model/replay_model.dart';
import 'package:balag/core/model/report_model.dart';
import 'package:balag/linkApi.dart';
import 'package:balag/view/widget/widgetDetails/customBodyDetails.dart';
import 'package:balag/view/widget/widgetDetails/customButtonDetails.dart';
import 'package:balag/view/widget/widgetDetails/customCardReplay.dart';
import 'package:balag/view/widget/widgetDetails/customLocationDetails.dart';
import 'package:balag/view/widget/widgetDetails/customStatusDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListDetails extends StatelessWidget {
  final Report reportmodel;

  const CustomListDetails({super.key, required this.reportmodel});

  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    var link = linkApi.linkImage;
    var i1 = reportmodel.policeReportImage;
    var i2 = reportmodel.policeReportImage2;
    var i3 = reportmodel.policeReportImage3;
    return GetBuilder<DetailsController>(
      builder: (controller) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                height: 180,
                // width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    i1 == ""
                        ? Container()
                        : Image.network(
                            "$link/${reportmodel.policeReportImage}",
                            width: Get.width * 0.3,
                            height: 180,
                          ),
                    i2 == ""
                        ? Container()
                        : Image.network(
                            "$link/${reportmodel.policeReportImage2}",
                            width: Get.width * 0.50,
                            height: 180,
                          ),
                    i3 == ""
                        ? Container()
                        : Image.network(
                            "$link/${reportmodel.policeReportImage3}",
                            width: Get.width * 0.50,
                            height: 180,
                          )
                  ],
                ),
              ),
              Stack(
                children: [
                  CustomBodyDetails(body: "${reportmodel.policeReportBody}"),
                  CustomStatusDetails(
                    widget: controller.status == 0
                        ? Icon(
                            Icons.done,
                            color: Colors.grey[900],
                            size: 25,
                          )
                        : controller.status == 1
                            ? const Icon(
                                Icons.done_all,
                                color: Colors.black,
                                size: 25,
                              )
                            : Icon(
                                Icons.done_all,
                                color: Colors.green[800],
                                size: 25,
                              ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 60,
                      child: Text("${reportmodel.policeReportTime}"))
                ],
              ),
              const SizedBox(height: 8),
              CustomLocationDetails(
                  location: "${reportmodel.policeReportLocation}"),
              const SizedBox(height: 8),

              ////
              ///
              /////
              ///here the replay
              controller.status == 2
                  ? Container(
                      height: 100,
                      child: FutureBuilder(
                        future: controller.status == 2
                            ? controller.getReplay()
                            : null,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print("///////////////////");
                          if (snapshot.hasData) {
                            if (snapshot.data['status'] == 'fail') {
                              return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  height: 70,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 45, 4, 95),
                                        width: 2),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(35),
                                      bottomRight: Radius.circular(35),
                                      //topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                    ),
                                  ),
                                  child: const Text(
                                    "لا يوجد رد",
                                    style: TextStyle(fontSize: 22),
                                  ));
                            }
                            print("*********");
                            return ListView.builder(
                              itemCount: snapshot.data["data"].length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomCardReplay(
                                  replayModel: ReplayModel.fromJson(
                                      snapshot.data['data'][index]),
                                  // ontap: () {},
                                );
                              },
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return const Center(child: Text("Loading ...."));
                        },
                      ),
                    )
                  : Container(),

              ///
              ///
              ///
              ///هنا لاحضار الداتا الخاصة بالتقييم
              controller.status == 2
                  ? Container(
                      //height: 100,
                      child: FutureBuilder(
                        future: controller.testToDo(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print("///////////////////");
                          if (snapshot.hasData) {
                            if (snapshot.data['status'] == 'fail') {
                              return Container(
                                child: Text("data"),
                              );
                            }
                            print("*********");
                            return ListView.builder(
                              itemCount: snapshot.data["data"].length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          width: 2,
                                          color: const Color.fromARGB(
                                              255, 4, 54, 95),
                                        ),
                                      ),
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
                                              size: 30,
                                              color: Colors.amber,
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
                                              size: 30,
                                              color: Colors.amber,
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
                                              size: 30,
                                              color: Colors.amber,
                                            ),
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
                                              size: 30,
                                              color: Colors.amber,
                                            ),
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
                                              size: 30,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          //

                                          const Spacer(),
                                          const Text(
                                            "أضف تقييمك",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 4, 54, 95),
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      //
                                    )
                                  ],
                                );
                              },
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Center(child: Container());
                        },
                      ),
                    )
                  : Container(),

              ///
              ///
              ///
              ///
              ///

              //five star to rating
              const SizedBox(height: 8),
              controller.status == 2
                  ? Container(
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
                          GestureDetector(
                            onTap: () {
                              controller.onestar();
                            },
                            child: Icon(
                              controller.rating >= 1
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 30,
                              color: Colors.amber,
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
                              size: 30,
                              color: Colors.amber,
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                          //
                          //
                          //
                          const Spacer(),
                          const Text(
                            "أضف تقييمك",
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 54, 95),
                                fontSize: 20),
                          )
                        ],
                      ),
                      //
                    )
                  : Container(),
              const SizedBox(height: 8),
              //drop down day
              controller.status == 2
                  ? Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      //  padding: EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 4, 54, 95)),
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25)),
                      child: DropdownButtonFormField(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        hint: const Text(
                          "مدة الاستجابة",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 4, 54, 95)),
                        ),
                        items: controller.day
                            .map((e) => DropdownMenuItem(

                                // ignore: sort_child_properties_last
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 4, 54, 95)),
                                ),
                                value: e))
                            .toList(),
                        onChanged: (value) {
                          controller.changeday(value);
                        },
                        value: controller.newday,
                        //dropdownColor: const Color.fromARGB(255, 4, 54, 95),
                        isExpanded: false,
                        icon: const Icon(
                          Icons.location_city_outlined,
                          color: Color.fromARGB(255, 4, 54, 95),
                        ),
                        iconEnabledColor: Colors.white,
                      ),
                    )
                  : Container(),
              const SizedBox(height: 8),
              controller.status == 2
                  ? Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          CustomButtonDetails(
                            text: "Delete",
                            onPressed: () {
                              controller.delete();
                            },
                          ),
                          const Spacer(),
                          controller.ratingid == null
                              ? CustomButtonDetails(
                                  text: "Rating",
                                  onPressed: () {
                                    controller.ratingid == null
                                        ? controller.addRating()
                                        : Get.snackbar(
                                            "", "لقد قمت بالتقييم تواَ");
                                    //controller.getrating();
                                    controller.refreshDetails();
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    )
                  : Container(),
              Text("${controller.status}"),
            ],
          ),
        );
      },
    );
  }
}
*/