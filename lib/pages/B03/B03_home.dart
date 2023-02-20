import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B03_home extends StatefulWidget {
  const B03_home({Key? key}) : super(key: key);

  @override
  _B03_homeState createState() => _B03_homeState();
}

class _B03_homeState extends State<B03_home>
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
                              'assets/images/b03_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 11.7 * widthRatio,
                      top: 6.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_title.png',
                          width: 166.2 * widthRatio,
                          height: 38.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 205.05 * widthRatio,
                      top: 15.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_sparrow.png',
                          width: 36.3 * widthRatio,
                          height: 33.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_mid_sparrow.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 135.45 * widthRatio,
                      top: 51.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_seagull.png',
                          width: 58.5 * widthRatio,
                          height: 38.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_mid_seagull.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 202.8 * widthRatio,
                      top: 38.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_hawk.png',
                          width: 69.9 * widthRatio,
                          height: 99.3 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_mid_hawk.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 274.95 * widthRatio,
                      top: 73.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_owl.png',
                          width: 31.35 * widthRatio,
                          height: 54.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_rig_owl.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 297.6 * widthRatio,
                      top: 51.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_parrot.png',
                          width: 51.15 * widthRatio,
                          height: 65.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_rig_parrot.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 136.95 * widthRatio,
                      top: 102.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_seal.png',
                          width: 82.65 * widthRatio,
                          height: 64.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_mid_seal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 3.6 * widthRatio,
                      top: 69.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_polarbear.png',
                          width: 128.7 * widthRatio,
                          height: 117.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_left_polarbear.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 19.5 * widthRatio,
                      top: 122.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_penguin.png',
                          width: 32.55 * widthRatio,
                          height: 79.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_top_left_penguin.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 273.6 * widthRatio,
                      top: 172.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_jellyfish.png',
                          width: 57.9 * widthRatio,
                          height: 62.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_rig_jellyfish.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 220.95 * widthRatio,
                      top: 181.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_squid.png',
                          width: 63.6 * widthRatio,
                          height: 56.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_rig_squid.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 70.65 * widthRatio,
                      top: 199.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_shark.png',
                          width: 133.5 * widthRatio,
                          height: 67.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_mid_shark.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 15 * widthRatio,
                      top: 234.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_turtle.png',
                          width: 64.35 * widthRatio,
                          height: 55.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_left_turtle.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 37.65 * widthRatio,
                      top: 297.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_hippocampus.png',
                          width: 42.3 * widthRatio,
                          height: 30.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_left_hippocampus.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 11.7 * widthRatio,
                      top: 346.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_dolphin.png',
                          width: 106.2 * widthRatio,
                          height: 61.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_left_dolphin.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 28.95 * widthRatio,
                      top: 405.9 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_crab.png',
                          width: 53.7 * widthRatio,
                          height: 40.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_left_crab.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 121.2 * widthRatio,
                      top: 389.25 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_octopus.png',
                          width: 42.15 * widthRatio,
                          height: 63.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_mid_octopus.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 47.7 * widthRatio,
                      top: 456.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_seashell.png',
                          width: 84.45 * widthRatio,
                          height: 31.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_left_seashell.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 152.85 * widthRatio,
                      top: 450.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_starfish.png',
                          width: 58.8 * widthRatio,
                          height: 36.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_mid_starfish.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 313.35 * widthRatio,
                      top: 380.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_shrimp.png',
                          width: 33.6 * widthRatio,
                          height: 40.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_bot_rig_shrimp.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 89.7 * widthRatio,
                      top: 247.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_whale.png',
                          width: 270.3 * widthRatio,
                          height: 147.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_mid_whale.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 212.55 * widthRatio,
                      top: 246.3 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B03/b03_fish.png',
                          width: 56.55 * widthRatio,
                          height: 36.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B03/b03_mid_rig_fish.mp3');
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
