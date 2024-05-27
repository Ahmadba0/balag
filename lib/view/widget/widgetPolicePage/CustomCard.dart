// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors
import 'package:balag/core/model/report_model.dart';

import 'package:flutter/material.dart';

class CustomCardPolicePage extends StatelessWidget {
  final void Function()? ontap;
  //final String title;
  // final String content;
  final Report reportmodel;
  final void Function()? edit;
  final void Function()? delete;
  const CustomCardPolicePage(
      {super.key,
      this.ontap,
      // required this.title,
      // required this.content,

      required this.reportmodel,
      required this.edit,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    //var link = linkApi.linkImage;
    return Container(
        height: 100,
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: ontap,
          child: Card(
            color: Colors.grey[300],
            child: Row(
              children: [
                /*Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage("$link/${reportmodel.policeReportImage}"),
                    radius: 40,
                  ),
                ),*/
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${reportmodel.policeReportBody}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 45, 4, 95)),
                        )
                      ],
                    )),
                /* Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: const Icon(Icons.delete), onPressed: delete)),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: const Icon(Icons.edit), onPressed: edit)),
              */
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color.fromARGB(255, 45, 4, 95),
                        ),
                        onPressed: ontap)),
              ],
            ),
          ),
        ));
  }
}
