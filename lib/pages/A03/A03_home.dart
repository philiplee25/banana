import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A03_home extends StatefulWidget {
  const A03_home({Key? key}) : super(key: key);

  @override
  _A03_homeState createState() => _A03_homeState();
}

class _A03_homeState extends State<A03_home>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  final double minScale = 1;
  final double maxScale = 4;

  late double blank;
  late double widthRatio;
  late double heightRatio;

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

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

    controller.dispose();
    animationController.dispose();

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
    blank = MediaQuery.of(context).size.height * 550 / 3374 / 2;
    final widthRatio = MediaQuery.of(context).size.width / 360;
    final heightRatio = MediaQuery.of(context).size.height / 740;

    return Scaffold(
      body: InteractiveViewer(
        clipBehavior: Clip.none,
        panEnabled: true,
        minScale: minScale,
        maxScale: maxScale,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              SizedBox(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: new AssetImage(
                              'assets/images/a03_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 10.35 * widthRatio,
                      top: 5.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_title.png',
                          width: 65.25 * widthRatio,
                          height: 49.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 79.65 * widthRatio,
                      top: 29.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_one.png',
                          width: 31.05 * widthRatio,
                          height: 79.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_left_num_one.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 97.05 * widthRatio,
                      top: 93.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_one.png',
                          width: 18 * widthRatio,
                          height: 13.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_left_one.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 115.2 * widthRatio,
                      top: 19.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_bear.png',
                          width: 68.1 * widthRatio,
                          height: 83.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_mid_bear.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 208.05 * widthRatio,
                      top: 26.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_two.png',
                          width: 52.65 * widthRatio,
                          height: 76.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_num_two.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 239.55 * widthRatio,
                      top: 92.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_two.png',
                          width: 19.65 * widthRatio,
                          height: 10.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_two.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 247.05 * widthRatio,
                      top: 0 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_spider.png',
                          width: 112.95 * widthRatio,
                          height: 115.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_spider.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 31.8 * widthRatio,
                      top: 103.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_three.png',
                          width: 58.5 * widthRatio,
                          height: 66.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_left_num_three.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 89.7 * widthRatio,
                      top: 147.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_three.png',
                          width: 24.9 * widthRatio,
                          height: 17.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_left_three.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 14.7 * widthRatio,
                      top: 170.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_chick.png',
                          width: 102.15 * widthRatio,
                          height: 60.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_left_chick.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 131.85 * widthRatio,
                      top: 108.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_four.png',
                          width: 54.6 * widthRatio,
                          height: 62.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_mid_num_four.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 186.9 * widthRatio,
                      top: 110.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_four.png',
                          width: 12.45 * widthRatio,
                          height: 20.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_mid_four.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 128.85 * widthRatio,
                      top: 133.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_cake.png',
                          width: 91.95 * widthRatio,
                          height: 102.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_mid_cake.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 230.7 * widthRatio,
                      top: 111.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_five.png',
                          width: 54.6 * widthRatio,
                          height: 60.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_num_five.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 286.5 * widthRatio,
                      top: 121.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_five.png',
                          width: 17.25 * widthRatio,
                          height: 14.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_five.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 233.1 * widthRatio,
                      top: 121.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_car.png',
                          width: 126.9 * widthRatio,
                          height: 110.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_top_rig_car.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 24.45 * widthRatio,
                      top: 243.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_six.png',
                          width: 53.1 * widthRatio,
                          height: 68.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_left_num_six.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 78.75 * widthRatio,
                      top: 258.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_six.png',
                          width: 17.55 * widthRatio,
                          height: 15.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_left_six.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 45.9 * widthRatio,
                      top: 246 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_penguin.png',
                          width: 129 * widthRatio,
                          height: 96.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_left_penguin.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 185.85 * widthRatio,
                      top: 243.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_seven.png',
                          width: 46.65 * widthRatio,
                          height: 81.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_rig_num_seven.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 204.6 * widthRatio,
                      top: 307.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_seven.png',
                          width: 17.4 * widthRatio,
                          height: 15.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_rig_seven.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 218.55 * widthRatio,
                      top: 234 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_larva.png',
                          width: 112.2 * widthRatio,
                          height: 113.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_mid_rig_larva.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 15.15 * widthRatio,
                      top: 350.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_eight.png',
                          width: 53.7 * widthRatio,
                          height: 58.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_left_num_eight.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 69.9 * widthRatio,
                      top: 364.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_eight.png',
                          width: 18.15 * widthRatio,
                          height: 15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_left_eight.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 22.35 * widthRatio,
                      top: 352.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_bee.png',
                          width: 105.75 * widthRatio,
                          height: 119.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_left_bee.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 142.95 * widthRatio,
                      top: 349.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_nine.png',
                          width: 56.55 * widthRatio,
                          height: 58.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_mid_num_nine.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 201.3 * widthRatio,
                      top: 360 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_nine.png',
                          width: 21.9 * widthRatio,
                          height: 20.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_mid_nine.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 133.35 * widthRatio,
                      top: 380.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_candy.png',
                          width: 99.45 * widthRatio,
                          height: 102.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_mid_candy.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 237.45 * widthRatio,
                      top: 348.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_num_ten.png',
                          width: 90.45 * widthRatio,
                          height: 61.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_rig_num_ten.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 328.8 * widthRatio,
                      top: 355.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_ten.png',
                          width: 20.7 * widthRatio,
                          height: 13.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_rig_ten.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 210.3 * widthRatio,
                      top: 372.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A03/a03_fish.png',
                          width: 149.7 * widthRatio,
                          height: 133.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A03/a03_bot_rig_fish.mp3');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
