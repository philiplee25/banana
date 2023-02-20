import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A06/A06_flash.dart';
import 'package:standbook/pages/A06/A06_home.dart';
import 'package:standbook/pages/A06/A06_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A06 extends StatefulWidget {
  const A06({Key? key}) : super(key: key);

  @override
  _A06State createState() => _A06State();
}

class _A06State extends State<A06> {
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
    A06_flash(),
    A06_home(),
    Magnifier(),
  ];
}
