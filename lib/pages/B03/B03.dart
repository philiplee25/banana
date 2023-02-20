import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B03/B03_flash.dart';
import 'package:standbook/pages/B03/B03_home.dart';
import 'package:standbook/pages/B03/B03_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B03 extends StatefulWidget {
  const B03({Key? key}) : super(key: key);

  @override
  _B03State createState() => _B03State();
}

class _B03State extends State<B03> {
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
    B03_flash(),
    B03_home(),
    Magnifier(),
  ];
}
