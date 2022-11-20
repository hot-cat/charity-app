import 'package:flutter/material.dart';

import 'custmolscrollBar.dart';

class SignedScreen extends StatefulWidget {
  SignedScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _SignedScreen createState() => _SignedScreen();
}

class _SignedScreen extends State<SignedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScrollviewAppBar(offset: 0),
        Expanded(child: Center(child: Text("Signed Screen"))),
      ],
    );
  }
}
