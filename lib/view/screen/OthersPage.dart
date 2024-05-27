// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({super.key});

  @override
  State<OthersPage> createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 97, 177),
        title: const Text(
          "اقسام اخرى",
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
          padding: const EdgeInsets.all(8),
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
          alignment: Alignment.topRight,
          child: const Text(
            "سوف يكون هنالك أقسام اخرى قريباً",
            style:
                TextStyle(color: Color.fromARGB(255, 4, 45, 95), fontSize: 25),
            textAlign: TextAlign.right,
          )),
    );
  }
}
