import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B04_home extends StatefulWidget {
  const B04_home({Key? key}) : super(key: key);

  @override
  _B04_homeState createState() => _B04_homeState();
}

class _B04_homeState extends State<B04_home>
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
                              'assets/images/b04_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 6.983228935 * widthRatio,
                      top: 2.036912462 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_title.png',
                          width: 71.50535462 * widthRatio,
                          height: 48.30392411 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 180.8365326 * widthRatio,
                      top: 2.18240621 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_pte.png',
                          width: 93.25520307 * widthRatio,
                          height: 61.10737387 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_top_mid_pte.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 131.1537684 * widthRatio,
                      top: 51.79577404 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_ste.png',
                          width: 127.4439281 * widthRatio,
                          height: 78.63937042 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_top_mid_ste.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 29.82420691 * widthRatio,
                      top: 60.52539888 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_yuo.png',
                          width: 100.5293999 * widthRatio,
                          height: 83.80439845 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_top_left_yuo.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 13.53000606 * widthRatio,
                      top: 147.5306598 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_pak.png',
                          width: 133.0450596 * widthRatio,
                          height: 54.41466149 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_left_pak.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 134.7181249 * widthRatio,
                      top: 136.8368693 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_obi.png',
                          width: 57.97534856 * widthRatio,
                          height: 52.01401466 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_mid_obi.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 0.436451808 * widthRatio,
                      top: 208.419793 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_nan.png',
                          width: 106.8579511 * widthRatio,
                          height: 71.80116429 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_left_nan.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 93.10971914 * widthRatio,
                      top: 27.93479948 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_bra.png',
                          width: 248.9957567 * widthRatio,
                          height: 262.1797326 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_mid_bra.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 290.4586785 * widthRatio,
                      top: 167.3905563 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_gal.png',
                          width: 61.61244696 * widthRatio,
                          height: 54.34191462 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_rig_gal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 291.2588402 * widthRatio,
                      top: 223.7693834 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_abi.png',
                          width: 48.44615074 * widthRatio,
                          height: 59.21595515 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_rig_abi.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 94.5645585 * widthRatio,
                      top: 250.8312204 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_kar.png',
                          width: 81.03455243 * widthRatio,
                          height: 96.09862009 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_mid_kar.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 216.9892908 * widthRatio,
                      top: 271.1275981 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_ank.png',
                          width: 136.682158 * widthRatio,
                          height: 110.3570073 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_mid_rig_ank.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 249.9414023 * widthRatio,
                      top: 382.284821 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_ter.png',
                          width: 104.0937563 * widthRatio,
                          height: 114.7945666 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_bot_rig_ter.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 4.000808244 * widthRatio,
                      top: 279.8572229 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B04/b04_apa.png',
                          width: 253.5785007 * widthRatio,
                          height: 219.6228116 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B04/b04_bot_left_apa.mp3');
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
