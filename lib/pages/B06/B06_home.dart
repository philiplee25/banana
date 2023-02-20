import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class B06_home extends StatefulWidget {
  const B06_home({Key? key}) : super(key: key);

  @override
  _B06_homeState createState() => _B06_homeState();
}

class _B06_homeState extends State<B06_home>
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
                              'assets/images/b06_background.jpg'),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 8.7 * widthRatio,
                      top: 6.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_title.png',
                          width: 71.25 * widthRatio,
                          height: 42.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_title_sound');
                        },
                      ),
                    ),
                    Positioned(
                      left: 85.8 * widthRatio,
                      top: 25.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_balloon.png',
                          width: 46.5 * widthRatio,
                          height: 72.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_left_balloon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 156 * widthRatio,
                      top: 12 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_airplane.png',
                          width: 66.75 * widthRatio,
                          height: 39.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_mid_airplane.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 10.2 * widthRatio,
                      top: 90.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_towtruck.png',
                          width: 94.95 * widthRatio,
                          height: 72.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_left_towtruck.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 99.9 * widthRatio,
                      top: 105.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_car.png',
                          width: 53.1 * widthRatio,
                          height: 49.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_left_car.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 21.9 * widthRatio,
                      top: 154.5 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_racing.png',
                          width: 88.8 * widthRatio,
                          height: 51.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_left_racing.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 146.85 * widthRatio,
                      top: 139.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_motorbike.png',
                          width: 43.2 * widthRatio,
                          height: 59.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_mid_motorbike.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 183.3 * widthRatio,
                      top: 105.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_police.png',
                          width: 66.6 * widthRatio,
                          height: 56.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_mid_police.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 278.25 * widthRatio,
                      top: 32.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_helicopter.png',
                          width: 44.1 * widthRatio,
                          height: 38.25 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_helicopter.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 199.95 * widthRatio,
                      top: 53.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_train.png',
                          width: 160.05 * widthRatio,
                          height: 62.85 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_train.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 258.9 * widthRatio,
                      top: 114.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_bus.png',
                          width: 96.45 * widthRatio,
                          height: 70.5 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_bus.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 193.2 * widthRatio,
                      top: 164.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ferry.png',
                          width: 91.5 * widthRatio,
                          height: 96.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_mid_ferry.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 295.35 * widthRatio,
                      top: 197.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ship.png',
                          width: 59.7 * widthRatio,
                          height: 69.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_rig_ship.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 249.75 * widthRatio,
                      top: 236.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_submarine.png',
                          width: 53.85 * widthRatio,
                          height: 58.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_rig_submarine.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 109.2 * widthRatio,
                      top: 208.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_kickboard.png',
                          width: 40.05 * widthRatio,
                          height: 60 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_mid_kickboard.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 6 * widthRatio,
                      top: 284.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_excavator.png',
                          width: 110.4 * widthRatio,
                          height: 83.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_left_excavator.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 12.15 * widthRatio,
                      top: 358.95 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_dumptruck.png',
                          width: 117.6 * widthRatio,
                          height: 100.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_bot_left_dumptruck.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 154.5 * widthRatio,
                      top: 353.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_bulldozer.png',
                          width: 98.55 * widthRatio,
                          height: 73.65 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_bot_mid_bulldozer.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 130.35 * widthRatio,
                      top: 261.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_firetruck.png',
                          width: 110.85 * widthRatio,
                          height: 86.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_mid_firetruck.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 251.25 * widthRatio,
                      top: 293.7 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ambulance.png',
                          width: 97.8 * widthRatio,
                          height: 75.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_rig_ambulance_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 254.7 * widthRatio,
                      top: 382.8 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_remicon.png',
                          width: 98.1 * widthRatio,
                          height: 67.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_bot_rig_remicon.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 158.4 * widthRatio,
                      top: 430.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_sweeper.png',
                          width: 151.95 * widthRatio,
                          height: 67.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_bot_mid_sweeper.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 168.9 * widthRatio,
                      top: 18.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_airplane_animal.png',
                          width: 14.55 * widthRatio,
                          height: 13.95 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_top_mid_airplane_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 99.9 * widthRatio,
                      top: 61.2 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_balloon_animal.png',
                          width: 16.95 * widthRatio,
                          height: 16.8 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_top_left_balloon_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 29.7 * widthRatio,
                      top: 96.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_towtruck_animal.png',
                          width: 22.05 * widthRatio,
                          height: 23.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_top_left_towtruck_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 232.2 * widthRatio,
                      top: 71.55 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_train_animal1.png',
                          width: 15.45 * widthRatio,
                          height: 18.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_mid_train_animal1.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 259.05 * widthRatio,
                      top: 79.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_train_animal2.png',
                          width: 29.4 * widthRatio,
                          height: 15.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_train_animal2.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 299.4 * widthRatio,
                      top: 84.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_train_animal3.png',
                          width: 28.35 * widthRatio,
                          height: 15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_train_animal3.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 284.4 * widthRatio,
                      top: 45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_helicopter_animal.png',
                          width: 12.45 * widthRatio,
                          height: 10.8 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_top_rig_helicopter_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 265.2 * widthRatio,
                      top: 127.35 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_bus_animal.png',
                          width: 25.35 * widthRatio,
                          height: 23.4 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_rig_bus_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 204.3 * widthRatio,
                      top: 112.05 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_police_animal.png',
                          width: 22.8 * widthRatio,
                          height: 19.35 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_top_mid_police_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 155.55 * widthRatio,
                      top: 144.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_motorbike_animal.png',
                          width: 20.25 * widthRatio,
                          height: 33 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_top_mid_motorbike_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 62.4 * widthRatio,
                      top: 156.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_racing_animal.png',
                          width: 25.05 * widthRatio,
                          height: 18.15 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_left_racing_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 12.75 * widthRatio,
                      top: 199.65 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_bicycle_animal.png',
                          width: 25.2 * widthRatio,
                          height: 33.45 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_left_bicycle_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 119.1 * widthRatio,
                      top: 212.1 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_kickboard_animal.png',
                          width: 26.1 * widthRatio,
                          height: 36.6 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_mid_kickboard_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 253.35 * widthRatio,
                      top: 189.45 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ferry_animal.png',
                          width: 25.5 * widthRatio,
                          height: 29.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_mid_ferry_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 320.85 * widthRatio,
                      top: 213.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ship_animal.png',
                          width: 18.9 * widthRatio,
                          height: 27.75 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound('sounds/B06/b06_mid_rig_ship_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 272.4 * widthRatio,
                      top: 258 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_submarine_animal.png',
                          width: 14.25 * widthRatio,
                          height: 15.9 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_rig_submarine_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 308.1 * widthRatio,
                      top: 309.75 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_ambulance_animal.png',
                          width: 24.45 * widthRatio,
                          height: 20.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_rig_ambulance_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 202.05 * widthRatio,
                      top: 273 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_firetruck_animal.png',
                          width: 32.4 * widthRatio,
                          height: 25.05 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_mid_firetruck_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 27.45 * widthRatio,
                      top: 294.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_excavator_animal.png',
                          width: 23.55 * widthRatio,
                          height: 31.8 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_mid_left_excavator_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 27.75 * widthRatio,
                      top: 389.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_dumptruck_animal.png',
                          width: 26.4 * widthRatio,
                          height: 25.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_bot_left_dumptruck_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 209.7 * widthRatio,
                      top: 359.4 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_bulldozer_animal.png',
                          width: 21.75 * widthRatio,
                          height: 25.2 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_bot_mid_bulldozer_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 241.2 * widthRatio,
                      top: 435.15 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_sweeper_animal.png',
                          width: 29.1 * widthRatio,
                          height: 29.55 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_bot_mid_sweeper_animal.mp3');
                        },
                      ),
                    ),
                    Positioned(
                      left: 316.05 * widthRatio,
                      top: 393.6 * heightRatio,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/B06/b06_remicon_animal.png',
                          width: 20.25 * widthRatio,
                          height: 20.1 * heightRatio,
                          color: Colors.black.withOpacity(0),
                        ),
                        onTap: () {
                          playSound(
                              'sounds/B06/b06_bot_rig_remicon_animal.mp3');
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
