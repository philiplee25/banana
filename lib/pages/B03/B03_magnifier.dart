import 'dart:ui';

export 'package:standbook/pages/magnifierPainter.dart';
import 'package:flutter/material.dart';
import 'package:standbook/pages/magnifierPainter.dart';

class Magnifier extends StatefulWidget {
  final double scale;
  final Size size;
  final CustomPainter painter;

  Magnifier({
    this.scale = 1.3,
    this.size = const Size(120, 120),
    this.painter = const MagnifierPainter(),
    Key? key,
  }) : super(key: key);

  @override
  _MagnifierState createState() => _MagnifierState();
}

class _MagnifierState extends State<Magnifier> {
  late Size _magnifierSize;
  late double _scale;
  late BorderRadius _radius;
  late double widthCenter;
  late double heightCenter;

  Offset _magnifierPosition = Offset(0, 0);
  Matrix4 matrix = Matrix4.identity();

  @override
  void initState() {
    _magnifierSize = widget.size;
    _scale = widget.scale;
    _radius = BorderRadius.circular(_magnifierSize.longestSide);
    matrix = Matrix4.identity()..scale(widget.scale);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Magnifier oldWidget) {
    if (oldWidget.size != widget.size) {
      _magnifierSize = widget.size;
      _radius = BorderRadius.circular(_magnifierSize.longestSide);
    }
    if (oldWidget.scale != widget.scale) {
      _scale = widget.scale;
      matrix = Matrix4.identity()..scale(_scale);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final double blank = MediaQuery.of(context).size.height * 110 / 740;

    void _onPanUpdate(DragUpdateDetails dragDetails) {
      setState(() {
        _magnifierPosition = dragDetails.globalPosition -
            dragDetails.delta -
            _magnifierSize.center(Offset(0, blank));

        double newX = _magnifierPosition.dx + (_magnifierSize.width / 2);
        double newY = _magnifierPosition.dy + (_magnifierSize.height / 2);
        final Matrix4 newMatrix = Matrix4.identity()
          ..translate(newX, newY)
          ..scale(_scale, _scale)
          ..translate(-newX, -newY);

        matrix = newMatrix;
      });
    }

    return Center(
      child: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/b03_background.jpg'),
          ),
          Positioned(
            top: _magnifierPosition.dy,
            left: _magnifierPosition.dx,
            child: ClipRRect(
                borderRadius: _radius,
                child: GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  child: BackdropFilter(
                    filter: ImageFilter.matrix(matrix.storage),
                    child: CustomPaint(
                      painter: widget.painter,
                      size: _magnifierSize,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
