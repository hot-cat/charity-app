import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                })));
  }
}
