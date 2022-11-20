import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WavyBar extends StatefulWidget {
  WavyBar(
      {Key? key,
      required this.color,
      required this.duration,
      required this.height})
      : super(key: key);
  final Color color;
  final int duration;
  final double height;

  @override
  _WavyBar createState() => _WavyBar(
        color: color,
        duration: duration,
        height: height,
      );
}

class _WavyBar extends State<WavyBar> {
  _WavyBar({required this.color, required this.duration, required this.height});
  Color color;
  int duration;
  double height;

  static const _backgroundColor = Colors.transparent;

  // ignore: prefer_final_fields
  // List<Colors> _colors = [
  //   // AppColors.lightPurple,
  //   // AppColors.lightDarkPurple,
  // ];

  // static const _durations = [
  //   80200,
  //   80000,
  // ];

  // List<double> _heightPercentages = [
  //   // 0.66,
  //   // 0.74,
  //   // -0.5,
  //   // -0.2
  // ];
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: WaveWidget(
        config: CustomConfig(
          colors: [color],
          durations: [duration],
          heightPercentages: [height],
        ),
        backgroundColor: _backgroundColor,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 20,
      ),
    );
  }
}
