import 'package:flutter/material.dart';

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
    return Center(child: Text("Home Screen"));
  }
}
