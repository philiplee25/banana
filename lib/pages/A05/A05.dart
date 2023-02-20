import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A05/A05_flash.dart';
import 'package:standbook/pages/A05/A05_home.dart';
import 'package:standbook/pages/A05/A05_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A05 extends StatefulWidget {
  const A05({Key? key}) : super(key: key);

  @override
  _A05State createState() => _A05State();
}

class _A05State extends State<A05> {
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
    A05_flash(),
    A05_home(),
    Magnifier(),
  ];
}
