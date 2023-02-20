import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A02/A02_flash.dart';
import 'package:standbook/pages/A02/A02_home.dart';
import 'package:standbook/pages/A02/A02_magnifier.dart';
import 'package:standbook/pages/get.dart';

class A02 extends StatefulWidget {
  const A02({Key? key}) : super(key: key);

  @override
  _A02State createState() => _A02State();
}

class _A02State extends State<A02> {
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
    A02_flash(),
    A02_home(),
    Magnifier(),
  ];
}
