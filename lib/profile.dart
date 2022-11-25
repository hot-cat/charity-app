import 'package:flutter/material.dart';

import 'custmolscrollBar.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomScrollviewAppBar(offset: 0),
        Expanded(child: Center(child: Text("Profile Screen"))),
      ],
    );
  }
}
