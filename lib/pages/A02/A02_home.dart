import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A02_home extends StatefulWidget {
  const A02_home({Key? key}) : super(key: key);

  @override
  _A02_homeState createState() => _A02_homeState();
}

class _A02_homeState extends State<A02_home>
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
      if (mounted)
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
            children: <Widget>[
              SizedBox(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: new AssetImage(
                              'assets/images/a02_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 13.8 * widthRatio,
                      top: 5.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_title.png',
                          width: 63.45 * widthRatio,
                          height: 44.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 7.65 * widthRatio,
                      top: 58.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ga.png',
                          width: 65.1 * widthRatio,
                          height: 67.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_left_ga.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 74.25 * widthRatio,
                      top: 61.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_bag.png',
                          width: 44.25 * widthRatio,
                          height: 62.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_left_bag.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 127.5 * widthRatio,
                      top: 52.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_na.png',
                          width: 59.85 * widthRatio,
                          height: 69.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_mid_na.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 189.15 * widthRatio,
                      top: 60.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_butterfly.png',
                          width: 48 * widthRatio,
                          height: 62.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_mid_butterfly.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 242.7 * widthRatio,
                      top: 58.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_da.png',
                          width: 59.7 * widthRatio,
                          height: 63.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_rig_da.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 304.05 * widthRatio,
                      top: 61.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_squirrel.png',
                          width: 50.7 * widthRatio,
                          height: 61.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_top_rig_squirrel.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 6.6 * widthRatio,
                      top: 147.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ra.png',
                          width: 65.85 * widthRatio,
                          height: 70.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_left_ra.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 73.5 * widthRatio,
                      top: 145.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_lilac.png',
                          width: 40.05 * widthRatio,
                          height: 74.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_left_lilac.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 129.15 * widthRatio,
                      top: 148.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ma.png',
                          width: 58.2 * widthRatio,
                          height: 65.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_mid_ma.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 189.75 * widthRatio,
                      top: 150.9 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_mic.png',
                          width: 41.1 * widthRatio,
                          height: 63.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_mid_mic.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 243.3 * widthRatio,
                      top: 147.9 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ba.png',
                          width: 60.75 * widthRatio,
                          height: 66.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_rig_ba.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 305.85 * widthRatio,
                      top: 152.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_banana.png',
                          width: 46.65 * widthRatio,
                          height: 64.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_rig_banana.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 11.55 * widthRatio,
                      top: 240 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_sa.png',
                          width: 62.55 * widthRatio,
                          height: 66.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_left_sa.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 74.7 * widthRatio,
                      top: 241.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_apple.png',
                          width: 44.1 * widthRatio,
                          height: 67.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_left_apple.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 126.3 * widthRatio,
                      top: 240.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_aa.png',
                          width: 61.05 * widthRatio,
                          height: 66.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_mid_aa.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 189.75 * widthRatio,
                      top: 240.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_baby.png',
                          width: 48.9 * widthRatio,
                          height: 65.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_mid_baby.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 243.3 * widthRatio,
                      top: 241.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ja.png',
                          width: 61.05 * widthRatio,
                          height: 62.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_rig_ja.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 303.75 * widthRatio,
                      top: 240.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_cycle.png',
                          width: 50.7 * widthRatio,
                          height: 65.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_mid_rig_cycle.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 7.8 * widthRatio,
                      top: 331.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_cha.png',
                          width: 63.15 * widthRatio,
                          height: 65.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_left_cha.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 70.05 * widthRatio,
                      top: 337.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_car.png',
                          width: 52.8 * widthRatio,
                          height: 55.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_left_car.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 129.75 * widthRatio,
                      top: 336.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ka.png',
                          width: 57.3 * widthRatio,
                          height: 58.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_mid-ka.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 190.35 * widthRatio,
                      top: 340.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_camera.png',
                          width: 43.65 * widthRatio,
                          height: 55.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_mid_camera.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 242.1 * widthRatio,
                      top: 332.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ta.png',
                          width: 61.95 * widthRatio,
                          height: 62.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_rig_ta.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 307.65 * widthRatio,
                      top: 330.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ostrich.png',
                          width: 40.2 * widthRatio,
                          height: 67.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_rig_ostrich.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 6.3 * widthRatio,
                      top: 422.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_pa.png',
                          width: 67.2 * widthRatio,
                          height: 66.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_left_pa.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 73.35 * widthRatio,
                      top: 422.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_pineapple.png',
                          width: 44.55 * widthRatio,
                          height: 66.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_left_pineapple.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 120.45 * widthRatio,
                      top: 423.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_ha.png',
                          width: 71.55 * widthRatio,
                          height: 67.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_mid_ha.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 192.3 * widthRatio,
                      top: 391.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A02/a02_hippo.png',
                          width: 147.15 * widthRatio,
                          height: 92.7 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A02/a02_bot_rig_hippo.mp3');
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
