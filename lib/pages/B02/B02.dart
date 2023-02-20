import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/B02/B02_flash.dart';
import 'package:standbook/pages/B02/B02_home.dart';
import 'package:standbook/pages/B02/B02_magnifier.dart';
import 'package:standbook/pages/get.dart';

class B02 extends StatefulWidget {
  const B02({Key? key}) : super(key: key);

  @override
  _B02State createState() => _B02State();
}

class _B02State extends State<B02> {
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
    B02_flash(),
    B02_home(),
    Magnifier(),
  ];
}
