// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, file_names
/*
import 'package:balag/linkApi.dart';
import 'package:balag/controller/police/detailsNEW_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        body: GetBuilder<DetailsNEWController>(
      builder: (controller) => Container(
        child: ListView(
          children: [
            ...List.generate(
              controller.detailsdata.length,
              (index) => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: controller.detailsdata[index]
                                    ['policeReport_image3'] !=
                                ''
                            ? 3
                            : controller.detailsdata[index]
                                        ['policeReport_image2'] !=
                                    ''
                                ? 2
                                : 1,
                        child: Container(
                          height: 150,
                          // width: 50,
                          child: Image.network(
                              fit: BoxFit.cover,
                              "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image']}"),
                        ),
                      ),
                      controller.detailsdata[index]['policeReport_image2'] == ''
                          ? Container()
                          : Expanded(
                              flex: controller.detailsdata[index]
                                          ['policeReport_image3'] !=
                                      ''
                                  ? 3
                                  : controller.detailsdata[index]
                                              ['policeReport_image2'] !=
                                          ''
                                      ? 2
                                      : 1,
                              child: Container(
                                height: 150,
                                // width: 50,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image2']}"),
                              ),
                            ),
                      controller.detailsdata[index]['policeReport_image3'] == ''
                          ? Container()
                          : Expanded(
                              flex: controller.detailsdata[index]
                                          ['policeReport_image3'] !=
                                      ''
                                  ? 3
                                  : controller.detailsdata[index]
                                              ['policeReport_image2'] !=
                                          ''
                                      ? 2
                                      : 1,
                              child: Container(
                                height: 150,
                                // width: 50,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    "${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image3']}"),
                              ),
                            )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Text(
                        "${controller.detailsdata[index]['policeReport_body']}"),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Text(
                        "${controller.detailsdata[index]['policeReport_status']}"),
                  ),
                  Container(
                    child: Text(
                        "${controller.detailsdata[index]['policeReport_time']}"),
                  ),
                  Container(
                    child: controller.detailsdata[index]
                                ['policeReport_status'] ==
                            0
                        ? const Icon(Icons.check)
                        : controller.detailsdata[index]
                                    ['policeReport_status'] ==
                                1
                            ? const Icon(Icons.checklist_sharp)
                            : const Icon(
                                Icons.checklist,
                                color: Colors.green,
                              ),
                  ),
                ],
              ),
            ),
            ...List.generate(
              controller.replaydata.length,
              (index) => Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      child: Text(
                          "${controller.replaydata[index]['policereplay_text']}"),
                    ),
                    Container(
                      child: Text(
                          "${controller.replaydata[index]['policereplay_time']}"),
                    ),
                  ],
                ),
              ),
            ),
            controller.getratingvalue == null
                ? Column(
                    children: [
                      controller.status == 2
                          ? Column(
                              children: [
                                Row(
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
                                          color: Color.fromARGB(255, 4, 54, 95),
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 27),
                                  //  padding: EdgeInsets.symmetric(horizontal: 70),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: const Color.fromARGB(
                                              255, 4, 54, 95)),
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButtonFormField(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70),
                                    hint: const Text(
                                      "مدة الاستجابة",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 4, 54, 95)),
                                    ),
                                    items: controller.day
                                        .map((e) => DropdownMenuItem(

                                            // ignore: sort_child_properties_last
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 4, 54, 95)),
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
                              ],
                            )
                          : Container(),
                      controller.status == 2
                          ? ElevatedButton(
                              onPressed: () {
                                controller.addRating();
                                controller.getrating();
                              },
                              child: Text("add rating"))
                          : Container()
                    ],
                  )
                //else
                : Column(
                    children: [
                      Row(
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
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
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                          //

                          const Spacer(),
                          const Text(
                            " تقييمك",
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 54, 95),
                                fontSize: 20),
                          )
                        ],
                      ),
                      Text("${controller.getratingday}")
                    ],
                  ),
            controller.status == 2
                ? ElevatedButton(
                    onPressed: () {
                      controller.delete();
                    },
                    child: Text("delete"))
                : Container()
          ],
        ),
      ),
    ));
  }
}
*/