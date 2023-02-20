import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B01_home extends StatefulWidget {
  const B01_home({Key? key}) : super(key: key);

  @override
  _B01_homeState createState() => _B01_homeState();
}

class _B01_homeState extends State<B01_home>
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
                              'assets/images/b01_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 7.2 * widthRatio,
                      top: 1.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_title.png',
                          width: 118.05 * widthRatio,
                          height: 47.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 5.25 * widthRatio,
                      top: 71.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_goat.png',
                          width: 71.1 * widthRatio,
                          height: 117.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_top_left_goat.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 160.2 * widthRatio,
                      top: 40.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_ostrich.png',
                          width: 69.45 * widthRatio,
                          height: 103.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_top_mid_ostrich.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 235.95 * widthRatio,
                      top: 57.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_milkcow.png',
                          width: 123.45 * widthRatio,
                          height: 102.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_top_right_milkcow.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 65.1 * widthRatio,
                      top: 136.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_rabbit.png',
                          width: 59.25 * widthRatio,
                          height: 59.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_top_left_rabbit.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 117.45 * widthRatio,
                      top: 164.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_sheep.png',
                          width: 97.5 * widthRatio,
                          height: 87.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_mid_sheep.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 248.4 * widthRatio,
                      top: 157.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_chicken.png',
                          width: 67.2 * widthRatio,
                          height: 60.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_right_chicken.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 318.3 * widthRatio,
                      top: 171.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_chick.png',
                          width: 27.9 * widthRatio,
                          height: 46.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_right_chick.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 12.3 * widthRatio,
                      top: 201.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_dog.png',
                          width: 97.05 * widthRatio,
                          height: 65.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_left_dog.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 90.75 * widthRatio,
                      top: 257.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_cat.png',
                          width: 78.3 * widthRatio,
                          height: 62.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_left_cat.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 193.2 * widthRatio,
                      top: 217.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_cow.png',
                          width: 166.8 * widthRatio,
                          height: 133.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_rig_cow.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 221.85 * widthRatio,
                      top: 315 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_calf.png',
                          width: 115.95 * widthRatio,
                          height: 65.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_rig_calf.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 157.95 * widthRatio,
                      top: 292.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_mouse.png',
                          width: 32.4 * widthRatio,
                          height: 36.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_mid_mid_mouse.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 52.2 * widthRatio,
                      top: 338.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_horse.png',
                          width: 176.1 * widthRatio,
                          height: 152.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_bot_mid_horse.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 260.55 * widthRatio,
                      top: 428.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_duck.png',
                          width: 72 * widthRatio,
                          height: 61.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_bot_rig_duck.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 280.05 * widthRatio,
                      top: 390.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_dragonfly.png',
                          width: 27.15 * widthRatio,
                          height: 32.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_bot_right_dragonfly.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 102.75 * widthRatio,
                      top: 381.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_bird.png',
                          width: 25.8 * widthRatio,
                          height: 26.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_bot_mid_bird.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 214.35 * widthRatio,
                      top: 0 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B01/b01_sun.png',
                          width: 61.05 * widthRatio,
                          height: 56.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B01/b05_top_mid_sun.mp3');
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
