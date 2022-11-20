import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'custmolscrollBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _offset = _controller.offset;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomScrollviewAppBar(offset: _offset),
        Expanded(
          child: ListView.builder(
              itemCount: 30,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text((index == 0) ? ' ' : 'Item ${index + 1}'),
                );
              }),
        ),
      ],
    ));
  }
}
