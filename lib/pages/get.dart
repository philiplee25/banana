import 'package:get/get.dart';

class IndexController extends GetxController {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    update();
    print(_selectedIndex);
  }
}
