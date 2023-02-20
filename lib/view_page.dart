import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:standbook/pages/A01/A01.dart';
import 'package:standbook/pages/A02/A02.dart';
import 'package:standbook/pages/A03/A03.dart';
import 'package:standbook/pages/A04/A04.dart';
import 'package:standbook/pages/A05/A05.dart';
import 'package:standbook/pages/A06/A06.dart';
import 'package:standbook/pages/B01/B01.dart';
import 'package:standbook/pages/B02/B02.dart';
import 'package:standbook/pages/B03/B03.dart';
import 'package:standbook/pages/B04/B04.dart';
import 'package:standbook/pages/B05/B05.dart';
import 'package:standbook/pages/B06/B06.dart';
import 'package:standbook/pages/get.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({Key? key}) : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget> {
  final PageController _controller = PageController();
  IndexController index = Get.put(IndexController());

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;

  final List<Widget> _pages = [
    A01(),
    A02(),
    A03(),
    A04(),
    A05(),
    A06(),
    B01(),
    B02(),
    B03(),
    B04(),
    B05(),
    B06(),
  ];

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playSound(String fileName) async {
    await audioCache.play(fileName);
  }

  stopSound() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final width = MediaQuery.of(context).size.width;
    final heightRatio = MediaQuery.of(context).size.height / 740;

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 113 * heightRatio,
        elevation: 0,
        actions: [
          SizedBox(
            width: width,
            child: Row(
              children: [
                Container(
                  height: 113 * heightRatio,
                  width: width / 2,
                  decoration: BoxDecoration(),
                  child: InkWell(
                    child: Ink(
                      color: Colors.white,
                      child: Icon(
                        CupertinoIcons.arrowtriangle_left_fill,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    onTap: () {
                      audioPlayerState == PlayerState.PLAYING
                          ? stopPrevious()
                          : _controller.previousPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOutQuart);
                    },
                  ),
                ),
                Container(
                  height: 113 * heightRatio,
                  width: width / 2,
                  decoration: BoxDecoration(),
                  child: InkWell(
                    child: Ink(
                      color: Colors.white,
                      child: Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    onTap: () {
                      audioPlayerState == PlayerState.PLAYING
                          ? stopPrevious()
                          : _controller.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOutQuart);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            dragStartBehavior: DragStartBehavior.start,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 120 * heightRatio,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: GetBuilder<IndexController>(
            builder: (_) {
              return BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 40,
                onTap: index.onItemTapped,
                currentIndex: index.selectedIndex,
                items: _BottomNavigationBarItem,
              );
            },
          ),
        ),
      ),
    );
  }

  void stopPrevious() {
    stopSound();

    _controller.previousPage(
        duration: Duration(milliseconds: 10), curve: Curves.easeInOutQuart);
  }

  void stopNext() {
    stopSound();

    _controller.nextPage(
        duration: Duration(milliseconds: 10), curve: Curves.easeInOutQuart);
  }

  List<BottomNavigationBarItem> _BottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.flashlight_on_outlined,
      ),
      label: '손전등',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.map_outlined,
        ),
        label: '홈'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search_outlined,
      ),
      label: '돋보기',
    ),
  ];
}
