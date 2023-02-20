import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B05/B05_flash.dart';
import 'package:standbook/pages/B05/B05_home.dart';
import 'package:standbook/pages/B05/B05_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B05 extends StatefulWidget {
  const B05({Key? key}) : super(key: key);

  @override
  _B05State createState() => _B05State();
}

class _B05State extends State<B05> {
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
    B05_flash(),
    B05_home(),
    Magnifier(),
  ];
}
