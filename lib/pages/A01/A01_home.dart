import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A01_home extends StatefulWidget {
  const A01_home({Key? key}) : super(key: key);

  @override
  _A01_homeState createState() => _A01_homeState();
}

class _A01_homeState extends State<A01_home>
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
    blank = MediaQuery.of(context).size.height * 57 / 740;
    final widthRatio = MediaQuery.of(context).size.width / 360;
    final heightRatio = MediaQuery.of(context).size.height / 740;

    return Scaffold(
      body: SafeArea(
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          panEnabled: true,
          minScale: minScale,
          maxScale: maxScale,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: new AssetImage(
                                'assets/images/a01_background.jpg'),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 130.2 * widthRatio,
                        top: 84.1 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_bird.png',
                            width: 40.8 * widthRatio,
                            height: 36.6 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_mid_bird.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 233.7 * widthRatio,
                        top: 61.9 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_bee.png',
                            width: 23.45 * widthRatio,
                            height: 23.4 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_rig_bee.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 21.9 * widthRatio,
                        top: 335.95 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_butterfly.png',
                            width: 31.65 * widthRatio,
                            height: 37.2 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_butterfly.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 286.5 * widthRatio,
                        top: 329.65 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_dog.png',
                            width: 67.65 * widthRatio,
                            height: 79.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_dog.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 98.4 * widthRatio,
                        top: 174.55 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_boy.png',
                            width: 101.25 * widthRatio,
                            height: 235.95 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_boy.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 177.9 * widthRatio,
                        top: 51.25 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_girl.png',
                            width: 178.35 * widthRatio,
                            height: 313.95 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_girl.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 9.45 * widthRatio,
                        top: 107.85 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_head.png',
                            width: 147.45 * widthRatio,
                            height: 154.85 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_left_head.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 33.45 * widthRatio,
                        top: 116.5 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_hair.png',
                            width: 44.7 * widthRatio,
                            height: 58.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_left_hair.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 70.2 * widthRatio,
                        top: 256.9 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_sholder.png',
                            width: 41.7 * widthRatio,
                            height: 15 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_sholder.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 28.8 * widthRatio,
                        top: 261.85 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_arm.png',
                            width: 72.75 * widthRatio,
                            height: 47.55 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_arm.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 55.5 * widthRatio,
                        top: 292.75 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_elbow.png',
                            width: 35.85 * widthRatio,
                            height: 25.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_elbow.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 88.65 * widthRatio,
                        top: 250.6 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_back.png',
                            width: 75.75 * widthRatio,
                            height: 64.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_back.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 81.15 * widthRatio,
                        top: 289.3 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_waist.png',
                            width: 91.2 * widthRatio,
                            height: 38.1 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_waist.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 75.15 * widthRatio,
                        top: 300.55 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_hip.png',
                            width: 103.35 * widthRatio,
                            height: 41.55 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_left_hip.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 154.8 * widthRatio,
                        top: 322.65 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_leg.png',
                            width: 55.2 * widthRatio,
                            height: 88.2 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_mid_leg.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 183.75 * widthRatio,
                        top: 356.5 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_knee.png',
                            width: 28.8 * widthRatio,
                            height: 13.2 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_knee.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 200.25 * widthRatio,
                        top: 114.4 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_face.png',
                            width: 134.1 * widthRatio,
                            height: 88.5 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_rig_face.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 245.25 * widthRatio,
                        top: 86.8 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_forehead.png',
                            width: 88.35 * widthRatio,
                            height: 72.3 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_top_rig_forehead.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 291.15 * widthRatio,
                        top: 187.75 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_cheek.png',
                            width: 31.8 * widthRatio,
                            height: 31.05 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_cheek.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 245.4 * widthRatio,
                        top: 195.4 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_chin.png',
                            width: 60.75 * widthRatio,
                            height: 32.25 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_chin.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 239.25 * widthRatio,
                        top: 201.4 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_neck.png',
                            width: 46.65 * widthRatio,
                            height: 26.4 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_neck.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 185.7 * widthRatio,
                        top: 207.25 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_chest.png',
                            width: 76.65 * widthRatio,
                            height: 36.3 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_chest.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 194.1 * widthRatio,
                        top: 256 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_abdomen.png',
                            width: 65.4 * widthRatio,
                            height: 21.9 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_mid_abdomen.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 187.05 * widthRatio,
                        top: 267.85 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_navel.png',
                            width: 50.25 * widthRatio,
                            height: 9.6 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_mid_rig_navel.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 39.15 * widthRatio,
                        top: 425.65 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_eye.png',
                            width: 24.15 * widthRatio,
                            height: 52.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_left_eye.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 37.65 * widthRatio,
                        top: 446.05 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_eyebrow.png',
                            width: 35.85 * widthRatio,
                            height: 9.9 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_left_eyebrow');
                          },
                        ),
                      ),
                      Positioned(
                        left: 84.3 * widthRatio,
                        top: 425.8 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_nose.png',
                            width: 24.75 * widthRatio,
                            height: 51.9 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_left_nose.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 127.65 * widthRatio,
                        top: 426.85 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_mouth.png',
                            width: 30.15 * widthRatio,
                            height: 53.4 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_mouth.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 129.45 * widthRatio,
                        top: 446.2 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_lips.png',
                            width: 39.6 * widthRatio,
                            height: 10.65 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_lips.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 130.35 * widthRatio,
                        top: 463.45 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_tongue.png',
                            width: 34.8 * widthRatio,
                            height: 9.3 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_tongue.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 118.8 * widthRatio,
                        top: 454.3 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_teeth.png',
                            width: 36.75 * widthRatio,
                            height: 6.75 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_teeth.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 178.35 * widthRatio,
                        top: 426.55 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_ear.png',
                            width: 23.85 * widthRatio,
                            height: 54.9 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_mid_ear.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 241.2 * widthRatio,
                        top: 426.25 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_hand.png',
                            width: 23.85 * widthRatio,
                            height: 58.05 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_hand.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 226.2 * widthRatio,
                        top: 446.8 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_finger.png',
                            width: 41.85 * widthRatio,
                            height: 19.5 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_finger.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 235.35 * widthRatio,
                        top: 443.05 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_fingernail.png',
                            width: 42.15 * widthRatio,
                            height: 19.35 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('a01_bot_rig_fingernail.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 288.75 * widthRatio,
                        top: 426.1 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_foot.png',
                            width: 24.45 * widthRatio,
                            height: 49.65 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_foot.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 278.7 * widthRatio,
                        top: 468.85 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_toe.png',
                            width: 37.65 * widthRatio,
                            height: 14.55 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_toe.mp3');
                          },
                        ),
                      ),
                      Positioned(
                        left: 300.6 * widthRatio,
                        top: 461.2 * heightRatio,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/A01/a01_toenail.png',
                            width: 23.85 * widthRatio,
                            height: 20.85 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                          onTap: () {
                            playSound('sounds/A01/a01_bot_rig_toenail.mp3');
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
      ),
    );
  }
}
