import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B01/B01_flash.dart';
import 'package:standbook/pages/B01/B01_home.dart';
import 'package:standbook/pages/B01/B01_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B01 extends StatefulWidget {
  const B01({Key? key}) : super(key: key);

  @override
  _B01State createState() => _B01State();
}

class _B01State extends State<B01> {
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
    B01_flash(),
    B01_home(),
    Magnifier(),
  ];
}
