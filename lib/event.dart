import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';

import 'custmolscrollBar.dart';

class EventWidget extends StatefulWidget {
  EventWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _EventWidget createState() => _EventWidget(title: title);
}

class _EventWidget extends State<EventWidget> {
  _EventWidget({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: width / 4 * 3,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkPurple,
        ),
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )));
  }
}
