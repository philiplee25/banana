import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A06_home extends StatefulWidget {
  const A06_home({Key? key}) : super(key: key);

  @override
  _A06_homeState createState() => _A06_homeState();
}

class _A06_homeState extends State<A06_home>
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
                              'assets/images/a06_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 7.5 * widthRatio,
                      top: 1.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_title.png',
                          width: 66.75 * widthRatio,
                          height: 45.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 16.8 * widthRatio,
                      top: 48.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_sun.png',
                          width: 63.45 * widthRatio,
                          height: 53.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_left_sun.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 118.65 * widthRatio,
                      top: 14.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_cloud.png',
                          width: 100.5 * widthRatio,
                          height: 58.8 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_mid_cloud.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 168.9 * widthRatio,
                      top: 65.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_bird.png',
                          width: 61.05 * widthRatio,
                          height: 43.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_mid_bird.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 101.85 * widthRatio,
                      top: 79.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_tree.png',
                          width: 72.45 * widthRatio,
                          height: 98.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_mid_tree.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 70.95 * widthRatio,
                      top: 149.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_dragonfly.png',
                          width: 41.7 * widthRatio,
                          height: 48 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_left_dragonfly.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 235.35 * widthRatio,
                      top: 15.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_star.png',
                          width: 22.05 * widthRatio,
                          height: 34.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_rig_star.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 257.85 * widthRatio,
                      top: 31.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_moon.png',
                          width: 47.85 * widthRatio,
                          height: 50.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_rig_moon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 233.7 * widthRatio,
                      top: 86.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_firefly.png',
                          width: 76.35 * widthRatio,
                          height: 46.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_top_rig_firefly.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 273.9 * widthRatio,
                      top: 164.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_spider.png',
                          width: 37.5 * widthRatio,
                          height: 63.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_rig_spider.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 171.9 * widthRatio,
                      top: 136.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_squirrel.png',
                          width: 83.85 * widthRatio,
                          height: 78.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_mid_squirrel.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 249.9 * widthRatio,
                      top: 223.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_bee.png',
                          width: 36.75 * widthRatio,
                          height: 31.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_rig_bee.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 293.55 * widthRatio,
                      top: 233.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_lizard.png',
                          width: 63.9 * widthRatio,
                          height: 100.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_rig_lizard.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 141.15 * widthRatio,
                      top: 216.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_hedgehog.png',
                          width: 115.05 * widthRatio,
                          height: 97.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_mid_hedgehog.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 266.4 * widthRatio,
                      top: 300.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_snail.png',
                          width: 50.4 * widthRatio,
                          height: 67.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_rig_snail.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 301.5 * widthRatio,
                      top: 355.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_larva.png',
                          width: 46.65 * widthRatio,
                          height: 46.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_rig_larva.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 196.5 * widthRatio,
                      top: 350.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_mole.png',
                          width: 89.1 * widthRatio,
                          height: 94.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_mid_mole.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 238.35 * widthRatio,
                      top: 449.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_ant.png',
                          width: 37.5 * widthRatio,
                          height: 36.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_rig_ant.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 134.1 * widthRatio,
                      top: 435.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_dungbeetle.png',
                          width: 83.55 * widthRatio,
                          height: 59.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_mid_dungbeetle.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 146.4 * widthRatio,
                      top: 392.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_worm.png',
                          width: 46.2 * widthRatio,
                          height: 34.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_mid_worm.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 118.95 * widthRatio,
                      top: 323.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_frog.png',
                          width: 69.9 * widthRatio,
                          height: 55.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_mid_frog.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 89.4 * widthRatio,
                      top: 365.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_mushroom.png',
                          width: 39.75 * widthRatio,
                          height: 52.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_left_mushroom.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 46.2 * widthRatio,
                      top: 416.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_ladybug.png',
                          width: 74.25 * widthRatio,
                          height: 37.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_left_ladybug.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 19.05 * widthRatio,
                      top: 346.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_stagbeetle.png',
                          width: 70.5 * widthRatio,
                          height: 52.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_left_stagbeetle.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 21.9 * widthRatio,
                      top: 300.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_beetle.png',
                          width: 74.85 * widthRatio,
                          height: 53.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_left_beetle.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 27.75 * widthRatio,
                      top: 239.85 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_butterfly.png',
                          width: 41.1 * widthRatio,
                          height: 48.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_mid_left_butterfly.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 292.5 * widthRatio,
                      top: 420.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A06/a06_flower.png',
                          width: 56.55 * widthRatio,
                          height: 79.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A06/a06_bot_rig_flower');
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
