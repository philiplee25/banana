import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A05_home extends StatefulWidget {
  const A05_home({Key? key}) : super(key: key);

  @override
  _A05_homeState createState() => _A05_homeState();
}

class _A05_homeState extends State<A05_home>
    with SingleTickerProviderStateMixin {
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
    blank = MediaQuery.of(context).size.height * 60 / 740;
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
                              'assets/images/a05_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 14.1 * widthRatio,
                      top: 5.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_title.png',
                          width: 121.5 * widthRatio,
                          height: 39.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('a05_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 147 * widthRatio,
                      top: 47.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_grape.png',
                          width: 73.8 * widthRatio,
                          height: 62.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_mid_grape.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 221.4 * widthRatio,
                      top: 86.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_melon.png',
                          width: 76.95 * widthRatio,
                          height: 67.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_rig_melon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 299.85 * widthRatio,
                      top: 125.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_orange.png',
                          width: 37.2 * widthRatio,
                          height: 55.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_rig_orange.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 254.55 * widthRatio,
                      top: 158.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_cherry.png',
                          width: 45.9 * widthRatio,
                          height: 37.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_rig_cherry.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 174.75 * widthRatio,
                      top: 145.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_banana.png',
                          width: 84.9 * widthRatio,
                          height: 74.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_mid_banana.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 287.25 * widthRatio,
                      top: 186 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_pear.png',
                          width: 64.65 * widthRatio,
                          height: 48.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_rig_pear.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 221.85 * widthRatio,
                      top: 206.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_peach.png',
                          width: 63.15 * widthRatio,
                          height: 54.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_rig_peach.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 280.65 * widthRatio,
                      top: 239.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_tomato.png',
                          width: 73.5 * widthRatio,
                          height: 52.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_rig_tomato.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 238.8 * widthRatio,
                      top: 284.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_watermelon.png',
                          width: 117.45 * widthRatio,
                          height: 123.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_rig_watermelon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 14.1 * widthRatio,
                      top: 57.9 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_pineapple.png',
                          width: 97.65 * widthRatio,
                          height: 110.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_left_pineapple.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 103.2 * widthRatio,
                      top: 120.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_apple.png',
                          width: 60.45 * widthRatio,
                          height: 45.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_left_apple.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 22.35 * widthRatio,
                      top: 153.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_lemon.png',
                          width: 52.5 * widthRatio,
                          height: 53.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_left_lemon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 73.95 * widthRatio,
                      top: 166.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_kiwi.png',
                          width: 51 * widthRatio,
                          height: 40.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_left_kiwi.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 124.05 * widthRatio,
                      top: 166.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_strawberry.png',
                          width: 40.95 * widthRatio,
                          height: 40.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_mid_strawberry.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 26.55 * widthRatio,
                      top: 225 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_cucumber.png',
                          width: 76.5 * widthRatio,
                          height: 81.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_left_cucumber.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 74.1 * widthRatio,
                      top: 222.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_corn.png',
                          width: 62.85 * widthRatio,
                          height: 84.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_left_corn.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 105.75 * widthRatio,
                      top: 257.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_eggplant.png',
                          width: 69.15 * widthRatio,
                          height: 57.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_left_eggplant.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 159.15 * widthRatio,
                      top: 221.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_carrot.png',
                          width: 66.75 * widthRatio,
                          height: 69.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_mid_carrot.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 159.9 * widthRatio,
                      top: 275.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_onion.png',
                          width: 60 * widthRatio,
                          height: 42.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_mid_onion.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 20.25 * widthRatio,
                      top: 310.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_potato.png',
                          width: 48.6 * widthRatio,
                          height: 56.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_left_potato.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 71.85 * widthRatio,
                      top: 309.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_kmelon.png',
                          width: 49.35 * widthRatio,
                          height: 56.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_left_kmelon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 130.05 * widthRatio,
                      top: 313.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_broccoli.png',
                          width: 44.55 * widthRatio,
                          height: 54.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_mid_broccoli.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 181.95 * widthRatio,
                      top: 308.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_paprika.png',
                          width: 44.55 * widthRatio,
                          height: 57.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_mid_mid_paprika.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 225.75 * widthRatio,
                      top: 39 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_girl.png',
                          width: 99.6 * widthRatio,
                          height: 82.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_right_girl.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 121.35 * widthRatio,
                      top: 385.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_pumpkin.png',
                          width: 125.4 * widthRatio,
                          height: 89.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_bot_mid_pumpkin.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 108.9 * widthRatio,
                      top: 43.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A05/a05_bee.png',
                          width: 34.65 * widthRatio,
                          height: 33.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A05/a05_top_left_bee.mp3');
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
