import 'dart:math';

import 'package:charity_app/theme.dart';
import 'package:charity_app/wave.dart';
import 'package:flutter/material.dart';

class CustomWeekBar extends StatelessWidget {
  const CustomWeekBar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    /// Here we leverage the maxExtent and minExtent properties
    /// of SliverAppBar to define the bounds between which
    /// the SliverAppBar will be animated during scrolling.

    const double maxExtent = 120;
    const double minExtent = 60;

    final double shrinkOffset = offset;

    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    // final interpolatedBackgroundColor = Color.lerp(
    //   Colors.blue,
    //   Colors.green,
    //   expendPercentage,
    // );
    final interpolatedAlignment = Alignment.lerp(
      Alignment.topCenter,
      Alignment.bottomCenter,
      expendPercentage,
    );
    // final interpolatedTextStyle = TextStyle.lerp(
    //   const TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.w500,
    //     color: Colors.black,
    //   ),
    //   const TextStyle(
    //     fontSize: 24,
    //     fontWeight: FontWeight.w800,
    //     color: Colors.yellow,
    //   ),
    //   expendPercentage,
    // );

    return Row(
      children: [
        Container(
            height: 0 + (maxExtent - 0) * expendPercentage,
            color: Colors.black,
            alignment: interpolatedAlignment,
            child: IgnorePointer(
              child: Align(
                alignment: Alignment.center,
                child: Text("<"),
              ),
            )),
        Container(
            height: minExtent + (maxExtent - minExtent) * expendPercentage,
            color: Colors.transparent,
            alignment: interpolatedAlignment,
            child: Text("THis week")),
      ],
    );
  }
}
