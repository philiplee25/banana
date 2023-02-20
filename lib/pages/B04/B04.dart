import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B04/B04_flash.dart';
import 'package:standbook/pages/B04/B04_home.dart';
import 'package:standbook/pages/B04/B04_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B04 extends StatefulWidget {
  const B04({Key? key}) : super(key: key);

  @override
  _B04State createState() => _B04State();
}

class _B04State extends State<B04> {
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
    B04_flash(),
    B04_home(),
    Magnifier(),
  ];
}
