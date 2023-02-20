import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B02_home extends StatefulWidget {
  const B02_home({Key? key}) : super(key: key);

  @override
  _B02_homeState createState() => _B02_homeState();
}

class _B02_homeState extends State<B02_home>
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
                              'assets/images/b02_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0 * widthRatio,
                      top: 1.454937473 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_title.png',
                          width: 129.6989291 * widthRatio,
                          height: 48.30392411 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 133.1905435 * widthRatio,
                      top: 52.66873652 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_snake.png',
                          width: 61.03051121 * widthRatio,
                          height: 37.75562743 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_top_mid_snake.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 225.572843 * widthRatio,
                      top: 41.39297111 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_monkey.png',
                          width: 56.37502526 * widthRatio,
                          height: 49.6861147 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_top_mid_monkey.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 283.9119014 * widthRatio,
                      top: 41.90219922 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_koala.png',
                          width: 58.5572843 * widthRatio,
                          height: 61.8348426 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_top_rig_koala.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 130.8628006 * widthRatio,
                      top: 85.0410953 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_giraffe.png',
                          width: 168.8341079 * widthRatio,
                          height: 199.6174213 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_mid_giraffe.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 264.8535058 * widthRatio,
                      top: 128.8347132 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_deer.png',
                          width: 77.97938978 * widthRatio,
                          height: 111.1572229 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_rig_deer.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 251.3234997 * widthRatio,
                      top: 231.0440707 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_crocodile.png',
                          width: 108.2400485 * widthRatio,
                          height: 81.91297973 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_rig_crocodile.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 9.601939786 * widthRatio,
                      top: 75.80224235 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_bear.png',
                          width: 112.5318246 * widthRatio,
                          height: 104.6827512 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_top_left_bear.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 124.9707012 * widthRatio,
                      top: 96.46235446 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_tiger.png',
                          width: 99.00181855 * widthRatio,
                          height: 75.80224235 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_top_mid_tiger.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 42.04485755 * widthRatio,
                      top: 152.0409659 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_kangaroo.png',
                          width: 98.92907658 * widthRatio,
                          height: 114.2853385 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_left_kangaroo.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 2.836936755 * widthRatio,
                      top: 262.7617076 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_zebra.png',
                          width: 101.1113356 * widthRatio,
                          height: 107.8836136 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_left_zebra.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 80.30713275 * widthRatio,
                      top: 256.8692109 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_elephant.png',
                          width: 173.7078198 * widthRatio,
                          height: 142.3656317 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_mid_elephant.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 242.4489796 * widthRatio,
                      top: 313.9755067 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_hippo.png',
                          width: 108.3127905 * widthRatio,
                          height: 90.06062958 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_mid_rig_hippo.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 253.9422105 * widthRatio,
                      top: 409.346658 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_fox.png',
                          width: 81.1072944 * widthRatio,
                          height: 58.41573954 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_bot_rig_fox.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 8.874520105 * widthRatio,
                      top: 390.7962053 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B02/b02_lion.png',
                          width: 143.8836129 * widthRatio,
                          height: 87.87822337 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B02/b02_bot_left_lion.mp3');
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
