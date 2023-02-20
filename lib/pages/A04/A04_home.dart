import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class A04_home extends StatefulWidget {
  const A04_home({Key? key}) : super(key: key);

  @override
  _A04_homeState createState() => _A04_homeState();
}

class _A04_homeState extends State<A04_home>
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
                              'assets/images/a04_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 9.310971914 * widthRatio,
                      top: 2.618887451 * heightRatio,
                      child: InkWell(
                        child: Opacity(
                          opacity: 0,
                          child: Image.asset(
                            'assets/icons/A04/a04_title.png',
                            width: 96.52859163 * widthRatio,
                            height: 48.30392411 * heightRatio,
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_title_sound.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 3.637098404 * widthRatio,
                      top: 90.20612333 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_desk.png',
                          width: 114.2048899 * widthRatio,
                          height: 85.69581716 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_left_desk.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 31.93372398 * widthRatio,
                      top: 117.9954291 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_book.png',
                          width: 36.51646797 * widthRatio,
                          height: 20.87835274 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_left_book.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 74.77874318 * widthRatio,
                      top: 120.2505821 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_pencil.png',
                          width: 30.26065872 * widthRatio,
                          height: 17.6774903 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_left_pencil.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 147.5934532 * widthRatio,
                      top: 59.3614489 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_shirt.png',
                          width: 31.78824005 * widthRatio,
                          height: 48.08568348 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_shirt.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 181.7821782 * widthRatio,
                      top: 58.63398016 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_skirt.png',
                          width: 34.98888664 * widthRatio,
                          height: 46.48525226 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_skirt.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 157.0499091 * widthRatio,
                      top: 91.29732643 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_jacket.png',
                          width: 57.97534856 * widthRatio,
                          height: 39.57429927 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_jacket.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 117.0418266 * widthRatio,
                      top: 111.2299698 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_pants.png',
                          width: 32.95211154 * widthRatio,
                          height: 50.34083657 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_pants.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 112.5318246 * widthRatio,
                      top: 31.49939629 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_closet.png',
                          width: 129.2624773 * widthRatio,
                          height: 131.2353601 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_closet.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 146.3568398 * widthRatio,
                      top: 99.51772316 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_bed.png',
                          width: 209.4241261 * widthRatio,
                          height: 111.8119448 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_rig_bed.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 248.6320469 * widthRatio,
                      top: 115.8130229 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_bag.png',
                          width: 43.42695494 * widthRatio,
                          height: 37.39189306 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_rig_bag.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 301.8064255 * widthRatio,
                      top: 146.5122035 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_pillow.png',
                          width: 42.55405132 * widthRatio,
                          height: 40.301768 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_rig_pillow.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 228.7007476 * widthRatio,
                      top: 164.4806813 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_bedding.png',
                          width: 93.83713882 * widthRatio,
                          height: 43.72087107 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_rig_bedding.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 15.63952314 * widthRatio,
                      top: 147.8216473 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_chair.png',
                          width: 45.02727824 * widthRatio,
                          height: 56.66981458 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_left_chair.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 84.38068297 * widthRatio,
                      top: 178.7390686 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_crayon.png',
                          width: 41.2446959 * widthRatio,
                          height: 31.71763691 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_left_crayon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 143.0107092 * widthRatio,
                      top: 178.5208279 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_cap.png',
                          width: 32.07920792 * widthRatio,
                          height: 28.95325571 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_cap.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 174.6534653 * widthRatio,
                      top: 166.2993532 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_socks.png',
                          width: 27.13275409 * widthRatio,
                          height: 30.84467443 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_top_mid_socks.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 5.455647606 * widthRatio,
                      top: 232.5717551 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_refrigerator.png',
                          width: 59.21196201 * widthRatio,
                          height: 103.7370418 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_left_refrigerator.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 93.83713882 * widthRatio,
                      top: 294.1156102 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_dish.png',
                          width: 45.53647201 * widthRatio,
                          height: 44.15735231 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_left_dish.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 136.4639321 * widthRatio,
                      top: 293.1699008 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_spoon.png',
                          width: 24.1503334 * widthRatio,
                          height: 44.66658042 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_mid_spoon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 67.35906244 * widthRatio,
                      top: 267.1992669 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_table.png',
                          width: 142.8652253 * widthRatio,
                          height: 85.55032342 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_mid_table.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 243.0309153 * widthRatio,
                      top: 229.2253989 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_mirror.png',
                          width: 56.37502526 * widthRatio,
                          height: 52.81423027 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_mirror.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 234.3018792 * widthRatio,
                      top: 284.0765416 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_washstand.png',
                          width: 64.37664175 * widthRatio,
                          height: 65.69042691 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_washstand.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 288.9310972 * widthRatio,
                      top: 251.1222078 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_toothpaste.png',
                          width: 18.25823399 * widthRatio,
                          height: 40.44726175 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_toothpaste.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 304.4251364 * widthRatio,
                      top: 261.2340233 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_toothbrush.png',
                          width: 17.96726611 * widthRatio,
                          height: 36.51893057 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_toothbrush.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 315.7001414 * widthRatio,
                      top: 230.7530832 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_towel.png',
                          width: 44.29985856 * widthRatio,
                          height: 50.70457094 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_towel.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 299.2604567 * widthRatio,
                      top: 302.4087538 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_soap.png',
                          width: 32.44291776 * widthRatio,
                          height: 42.70241483 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_mid_rig_soap.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 21.67710649 * widthRatio,
                      top: 362.6431652 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_window.png',
                          width: 68.23196605 * widthRatio,
                          height: 53.10521777 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_left_window.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 9.529197818 * widthRatio,
                      top: 434.2988357 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_piano.png',
                          width: 68.01374015 * widthRatio,
                          height: 54.63290211 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_left_piano.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 101.8387553 * widthRatio,
                      top: 396.1794739 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_bear.png',
                          width: 56.08405739 * widthRatio,
                          height: 43.79361794 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_left_bear.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 159.523136 * widthRatio,
                      top: 408.0372143 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_drum.png',
                          width: 34.26146696 * widthRatio,
                          height: 30.62643381 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_mid_drum.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 87.07213579 * widthRatio,
                      top: 369.626865 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_sofa.png',
                          width: 129.1169933 * widthRatio,
                          height: 100.2451919 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_mid_sofa.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 99.00181855 * widthRatio,
                      top: 469.8720569 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_xylophone.png',
                          width: 68.23196605 * widthRatio,
                          height: 30.11720569 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_left_xylophone.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 194.8029905 * widthRatio,
                      top: 455.9774041 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_violin.png',
                          width: 75.21519499 * widthRatio,
                          height: 41.46571798 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_mid_violin.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 204.3321883 * widthRatio,
                      top: 366.789737 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_clock.png',
                          width: 36.08001616 * widthRatio,
                          height: 43.57537732 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_mid_clock.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 232.7015559 * widthRatio,
                      top: 373.7734368 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_vacuum_cleaner.png',
                          width: 50.99211962 * widthRatio,
                          height: 90.71535144 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/A04/a04_bot_rig_vacuum_cleaner.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 280.6385128 * widthRatio,
                      top: 380.029668 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_umbrella.png',
                          width: 21.02242877 * widthRatio,
                          height: 65.54493316 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_rig_umbrella.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 298.8240048 * widthRatio,
                      top: 365.2620526 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_door.png',
                          width: 51.13760356 * widthRatio,
                          height: 76.31147046 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_rig_door.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 306.8256213 * widthRatio,
                      top: 446.8840448 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/A04/a04_shoe.png',
                          width: 34.4069509 * widthRatio,
                          height: 35.71871496 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/A04/a04_bot_rig_shoe.mp3');
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
