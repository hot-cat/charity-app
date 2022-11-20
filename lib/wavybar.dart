import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WavyBar extends StatefulWidget {
  WavyBar({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _WavyBar createState() => _WavyBar();
}

class _WavyBar extends State<WavyBar> {
  static const _backgroundColor = Colors.transparent;

  static const _colors = [
    AppColors.lightPurple,
    AppColors.lightDarkPurple,
  ];

  static const _durations = [
    20200,
    20000,
  ];

  List<double> _heightPercentages = [
    0.66,
    0.74,
  ];
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: WaveWidget(
        config: CustomConfig(
          colors: _colors,
          durations: _durations,
          heightPercentages: _heightPercentages,
        ),
        backgroundColor: _backgroundColor,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 20,
      ),
    );
  }
}
