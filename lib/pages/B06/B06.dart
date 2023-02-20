import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B06/B06_flash.dart';
import 'package:standbook/pages/B06/B06_home.dart';
import 'package:standbook/pages/B06/B06_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B06 extends StatefulWidget {
  const B06({Key? key}) : super(key: key);

  @override
  _B06State createState() => _B06State();
}

class _B06State extends State<B06> {
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
    B06_flash(),
    B06_home(),
    Magnifier(),
  ];
}
