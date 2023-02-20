import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A04/A04_flash.dart';
import 'package:standbook/pages/A04/A04_home.dart';
import 'package:standbook/pages/A04/A04_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A04 extends StatefulWidget {
  const A04({Key? key}) : super(key: key);

  @override
  _A04State createState() => _A04State();
}

class _A04State extends State<A04> {
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
    A04_flash(),
    A04_home(),
    Magnifier(),
  ];
}
