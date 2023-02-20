import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A01/A01_home.dart';
import 'package:standbook/pages/A01/A01_flash.dart';
import 'package:standbook/pages/A01/A01_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A01 extends StatefulWidget {
  const A01({Key? key}) : super(key: key);

  @override
  A01State createState() => A01State();
}

class A01State extends State<A01> {
  IndexController index = Get.put(IndexController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IndexController>(
        builder: (_) {
          return _widgetOptions.elementAt(index.selectedIndex);
        },
      ),
    );
  }

  List _widgetOptions = [
    A01_flash(),
    A01_home(),
    Magnifier(),
  ];
}
