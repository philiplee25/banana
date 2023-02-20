import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class A06_flash extends StatefulWidget {
  const A06_flash({Key? key}) : super(key: key);

  @override
  _A06_flashState createState() => _A06_flashState();
}

class _A06_flashState extends State<A06_flash> {
  Offset offset = Offset.zero;
  late double blank;

  @override
  Widget build(BuildContext context) {
    blank = MediaQuery.of(context).size.height * 57 / 740;
    int width = (MediaQuery.of(context).size.width).toInt();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SizedBox(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken),
                    image: AssetImage('assets/images/a06_background.jpg'),
                  ),
                ),
              ),
              FutureBuilder(
                future: loadImage('assets/images/a06_background.jpg', width),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) ;
                  return ShaderMask(
                    shaderCallback: (_) {
                      return ImageShader(
                          snapshot.data as ui.Image,
                          TileMode.mirror,
                          TileMode.mirror,
                          Matrix4.identity().storage);
                    },
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: offset.dx,
                          top: offset.dy,
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                offset = Offset(offset.dx + details.delta.dx,
                                    offset.dy + details.delta.dy);
                              });
                            },
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ui.Image> loadImage(String asset, width) async {
    ByteData data = await rootBundle.load(asset);
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final ui.Image image = (await codec.getNextFrame()).image;
    return image;
  }
}
