import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A03/A03_flash.dart';
import 'package:standbook/pages/A03/A03_home.dart';
import 'package:standbook/pages/A03/A03_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A03 extends StatefulWidget {
  const A03({Key? key}) : super(key: key);

  @override
  _A03State createState() => _A03State();
}

class _A03State extends State<A03> {
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
    A03_flash(),
    A03_home(),
    Magnifier(),
  ];
}
