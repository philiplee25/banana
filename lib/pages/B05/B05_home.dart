import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B05_home extends StatefulWidget {
  const B05_home({Key? key}) : super(key: key);

  @override
  _B05_homeState createState() => _B05_homeState();
}

class _B05_homeState extends State<B05_home>
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
                              'assets/images/b05_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 26.84178622 * widthRatio,
                      top: 48.81315222 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_ker.png',
                          width: 102.7844009 * widthRatio,
                          height: 93.55247952 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_top_left_ker.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 140.2465144 * widthRatio,
                      top: 48.81315222 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_mic.png',
                          width: 54.62921802 * widthRatio,
                          height: 58.85222078 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_top_mid_mic.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 132.5358658 * widthRatio,
                      top: 110.9389823 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_alo.png',
                          width: 111.2224692 * widthRatio,
                          height: 65.32669254 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_top_mid_alo.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 4.510002021 * widthRatio,
                      top: 131.5263476 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_tri.png',
                          width: 139.5190948 * widthRatio,
                          height: 109.0475636 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_mid_left_tri.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 207.6783189 * widthRatio,
                      top: 42.99340233 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_spi.png',
                          width: 135.7365124 * widthRatio,
                          height: 141.2016818 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_top_rig_spi.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 264.7080218 * widthRatio,
                      top: 190.3785683 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_par.png',
                          width: 94.5645585 * widthRatio,
                          height: 113.0486417 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_mid_rig_par.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 250.8143059 * widthRatio,
                      top: 302.0450194 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_bel.png',
                          width: 70.48696706 * widthRatio,
                          height: 45.8305304 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_mid_rig_bel.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 212.6975146 * widthRatio,
                      top: 380.3934023 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_mos.png',
                          width: 147.3024854 * widthRatio,
                          height: 125.7065977 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_bot_rig_mos.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 159.7413619 * widthRatio,
                      top: 410.7288486 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_ple.png',
                          width: 99.07456052 * widthRatio,
                          height: 65.69042691 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_bot_mid_ple.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 10.4748434 * widthRatio,
                      top: 330.2708064 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_dil.png',
                          width: 63.86744797 * widthRatio,
                          height: 69.61875809 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_bot_left_dil.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 2.909678723 * widthRatio,
                      top: 166.5175938 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B05/b05_tir.png',
                          width: 266.0901192 * widthRatio,
                          height: 334.5628719 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B05/b05_mid_mid_tir.mp3');
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
