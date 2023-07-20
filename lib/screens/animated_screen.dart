import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  void changeShape() {
    final random = Random();
    _width = random.nextInt(300) + 70;
    _height = random.nextInt(300) + 70;
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outlined, size: 35.0),
        onPressed: changeShape,
      ),
    );
  }
}
